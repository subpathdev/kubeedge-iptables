package iptables

import (
	"context"
	"encoding/json"
	"fmt"
	"strconv"

	"github.com/kubeedge/kubeedge/cloud/pkg/cloudstream/iptables"
	"github.com/kubeedge/kubeedge/cloud/pkg/common/modules"
	v1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
	"k8s.io/klog/v2"
	utiliptables "k8s.io/kubernetes/pkg/util/iptables"
)

const tunnelPortChain utiliptables.Chain = "TUNNEL-PORT"

type IPTablesJumpChain struct {
	Table     utiliptables.Table
	dstChain  utiliptables.Chain
	srcChain  utiliptables.Chain
	comment   string
	extraArgs []string
}

var ipTablesJumpChains = []IPTablesJumpChain{
	{utiliptables.TableNAT, tunnelPortChain, utiliptables.ChainOutput, "kubeedge tunnel port", nil},
	{utiliptables.TableNAT, tunnelPortChain, utiliptables.ChainPrerouting, "kubeedge tunnel port", nil},
}

type Manager interface {
	Run()
}

type manager struct {
	clientset *kubernetes.Clientset
	namespace string
	configMap string
	port      int
	lastIpTablesRecord iptables.TunnelPortRecord
}

func (m manager) createArgs(ip string, port int) []string {
	args := []string{
		"-p",
		"tcp",
		"-j",
		"DNAT",
		"--dport",
		strconv.Itoa(port),
		"--to",
		fmt.Sprintf("%s:%d", ip, m.port),
	}
	return args
}

func (m *manager) Run() {
	var ipManager utiliptables.Interface

		confMap, err := m.clientset.CoreV1().ConfigMaps(m.namespace).Get(context.Background(), m.configMap, v1.GetOptions{})
		if err != nil {
			klog.Errorf("cannot get configuration map %s from namespace %s ")
			return
		}

		ipTablesConfString := confMap.Annotations[modules.TunnelPortRecordAnnotationKey]

		var record iptables.TunnelPortRecord
		if err := json.Unmarshal([]byte(ipTablesConfString), &record); err != nil {
			klog.Errorf("cannot unmarshal tunnel port record: %s", err)
			return
		}

		equal := m.compareRules(m.lastIpTablesRecord, record)
		if !equal {
			for _, jump := range ipTablesJumpChains {
				if _, err := ipManager.EnsureChain(jump.Table, jump.dstChain); err != nil {
					klog.Errorf("failed to ensure chain: %s", err)
					return
				}

				args := append(
					jump.extraArgs,
					"-m",
					"comment",
					"--comment",
					jump.comment,
					"-j",
					string(jump.dstChain),
				)

				if _, err := ipManager.EnsureRule(utiliptables.Append, jump.Table, jump.srcChain, args...); err != nil {
					klog.Errorf("faild to ensure rule: %s", err)
					return
				}
			}

			for ip, port := range m.lastIpTablesRecord.IPTunnelPort {
				args := m.createArgs(ip, port)

				if err := ipManager.DeleteRule(utiliptables.TableNAT, tunnelPortChain, args...); err != nil {
					klog.Errorf("cannot delete rule: %s")
					return
				}
			}

			for ip, port := range record.IPTunnelPort {
				args := m.createArgs(ip, port)

				if _, err := ipManager.EnsureRule(utiliptables.Append, utiliptables.TableNAT, tunnelPortChain, args...); err != nil {
					klog.Errorf("cannot delete rule: %s")
					return
				}
			}

		}

		m.lastIpTablesRecord = record
}

func NewManager(clientset *kubernetes.Clientset, namespace, configMap string, port int) Manager {
	return &manager{
		clientset: clientset,
		namespace: namespace,
		configMap: configMap,
		port:      port,
	}
}

// compareRules compare the both ip tables rules
// if the rules are equal true will be returned else false will be returned
func (m manager) compareRules(lastRecord, newRecord iptables.TunnelPortRecord) bool {
	// compare port
	if len(newRecord.Port) != len(lastRecord.Port) {
		return false
	}

	for i, v := range newRecord.Port {
		oV, ok := lastRecord.Port[i]
		if !ok {
			return false
		}

		if v != oV {
			return false
		}

	}

	if len(newRecord.IPTunnelPort) != len(lastRecord.IPTunnelPort) {
		return false
	}

	for i, v := range newRecord.IPTunnelPort {
		oV, ok := lastRecord.IPTunnelPort[i]
		if !ok {
			return false
		}

		if v != oV {
			return false
		}

	}

	return true
}
