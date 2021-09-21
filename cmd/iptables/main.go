package main

import (
	"net/http"
	"os"
	"strconv"
	"time"

	"github.com/kubeedge/kubeedge/cloud/pkg/common/modules"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/klog/v2"

	"github.com/subpathdev/kubeedge-iptables/pkg/iptables"
)

var (
	kubeedgeNamespace             string // default value should be kubeedge
	kubeedgeIpTablesConfigMapName string // should be tunnelport
	kubeedgeStreamPort            int    // default value is 10003
)

const (
	Namespace            = "IP_KUBEEDGE_NAMESPACE"
	Configmap            = "IP_KUBEEDGE_CONFIGMAP"
	Streamport           = "IP_KUBBEDGTE_STREAMPORT"
)

func init() {
	klog.InitFlags(nil)
	kubeedgeNamespace = os.Getenv(Namespace)
	configMap := os.Getenv(Configmap)
	if configMap == "" {
		kubeedgeIpTablesConfigMapName = modules.TunnelPort
	} else {
		kubeedgeIpTablesConfigMapName = configMap
	}

	var err error
	kubeedgeStreamPort, err = strconv.Atoi(os.Getenv(Streamport))
	if err != nil {
		klog.Errorf("cannot parse %s to int", os.Getenv(Streamport))
		os.Exit(1)
	}

	if kubeedgeNamespace == "" || kubeedgeIpTablesConfigMapName == "" || kubeedgeStreamPort == 0 {
		klog.Errorf("this programm is not correct configured")
		os.Exit(1)
	}
}

func main() {

	config, err := rest.InClusterConfig()
	if err != nil {
		klog.Errorf("cannot read the cluster configuration: %s", err)
		os.Exit(1)
	}

	clientset, err := kubernetes.NewForConfig(config)
	if err != nil {
		klog.Errorf("canno create a new clientset: %s", err)
		os.Exit(1)
	}

	manager := iptables.NewManager(clientset, kubeedgeNamespace, kubeedgeIpTablesConfigMapName, kubeedgeStreamPort)
	go func() {
		for {
			manager.Run()
			time.Sleep(1 * time.Hour)
		}
	}()

	http.Handle("/metrics", promhttp.Handler())
	if err := http.ListenAndServe(":8080", nil); err != nil {
		klog.Errorf("cannot listen and serve: %s", err)
		os.Exit(1)
	}
}
