module github.com/subpathdev/kubeedge-iptables

go 1.17

require (
	github.com/kubeedge/kubeedge v1.8.1
	k8s.io/klog v1.0.0
)

require (
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.1.1 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/go-logr/logr v0.4.0 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/protobuf v1.4.3 // indirect
	github.com/google/go-cmp v0.5.5 // indirect
	github.com/google/gofuzz v1.1.0 // indirect
	github.com/googleapis/gnostic v0.4.1 // indirect
	github.com/hashicorp/golang-lru v0.5.3 // indirect
	github.com/imdario/mergo v0.3.7 // indirect
	github.com/json-iterator/go v1.1.11 // indirect
	github.com/kubeedge/beehive v0.0.0 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.2-0.20181231171920-c182affec369 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.1 // indirect
	github.com/prometheus/client_golang v1.11.0 // indirect
	github.com/prometheus/client_model v0.2.0 // indirect
	github.com/prometheus/common v0.26.0 // indirect
	github.com/prometheus/procfs v0.6.0 // indirect
	github.com/satori/go.uuid v1.2.0 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	golang.org/x/net v0.0.0-20210224082022-3d97a244fca7 // indirect
	golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d // indirect
	golang.org/x/sys v0.0.0-20210603081109-ebe580a85c40 // indirect
	golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d // indirect
	golang.org/x/text v0.3.4 // indirect
	golang.org/x/time v0.0.0-20210220033141-f8bda1e9f3ba // indirect
	google.golang.org/appengine v1.6.5 // indirect
	google.golang.org/protobuf v1.26.0-rc.1 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	k8s.io/api v0.21.4 // indirect
	k8s.io/apimachinery v0.21.4 // indirect
	k8s.io/client-go v0.21.4 // indirect
	k8s.io/klog/v2 v2.8.0 // indirect
	k8s.io/kubernetes v1.21.4 // indirect
	k8s.io/utils v0.0.0-20201110183641-67b214c5f920 // indirect
	sigs.k8s.io/structured-merge-diff/v4 v4.1.2 // indirect
	sigs.k8s.io/yaml v1.2.0 // indirect
)

replace (
	github.com/Sirupsen/logrus v1.0.5 => github.com/sirupsen/logrus v1.0.5
	github.com/Sirupsen/logrus v1.3.0 => github.com/Sirupsen/logrus v1.0.6
	github.com/Sirupsen/logrus v1.4.0 => github.com/sirupsen/logrus v1.0.6
	github.com/apache/servicecomb-kie v0.1.0 => github.com/apache/servicecomb-kie v0.0.0-20190905062319-5ee098c8886f // indirect  . TODO: remove this line when servicecomb-kie has a stable release
	github.com/gopherjs/gopherjs v0.0.0 => github.com/gopherjs/gopherjs v0.0.0-20181103185306-d547d1d9531e // indirect
	github.com/kubeedge/beehive v0.0.0 => github.com/kubeedge/beehive v1.7.0
	github.com/kubeedge/viaduct v0.0.0 => github.com/kubeedge/viaduct v1.7.0
	k8s.io/api v0.0.0 => k8s.io/api v0.21.4
	k8s.io/apiextensions-apiserver v0.0.0 => k8s.io/apiextensions-apiserver v0.19.3
	k8s.io/apimachinery v0.0.0 => k8s.io/apimachinery v0.21.4
	k8s.io/apiserver v0.0.0 => k8s.io/apiserver v0.21.4
	k8s.io/cli-runtime v0.0.0 => k8s.io/cli-runtime v0.21.4
	k8s.io/client-go v0.0.0 => k8s.io/client-go v0.21.4
	k8s.io/cloud-provider v0.0.0 => k8s.io/cloud-provider v0.21.4
	k8s.io/cluster-bootstrap v0.0.0 => k8s.io/cluster-bootstrap v0.21.4
	k8s.io/code-generator v0.0.0 => k8s.io/code-generator v0.21.4
	k8s.io/component-base v0.0.0 => k8s.io/component-base v0.21.4
	k8s.io/component-helpers v0.0.0 => k8s.io/component-helpers v0.21.4
	k8s.io/controller-manager v0.0.0 => k8s.io/controller-manager v0.21.4
	k8s.io/cri-api v0.0.0 => k8s.io/cri-api v0.21.4
	k8s.io/csi-api v0.0.0 => k8s.io/csi-api v0.21.4
	k8s.io/csi-translation-lib v0.0.0 => k8s.io/csi-translation-lib v0.21.4
	k8s.io/gengo v0.0.0 => k8s.io/gengo v0.21.4
	k8s.io/heapster => k8s.io/heapster v1.2.0-beta.1 // indirect
	k8s.io/klog/v2 => k8s.io/klog/v2 v2.8.0
	k8s.io/kube-aggregator v0.0.0 => k8s.io/kube-aggregator v0.21.4
	k8s.io/kube-controller-manager v0.0.0 => k8s.io/kube-controller-manager v0.21.4
	k8s.io/kube-openapi v0.0.0 => k8s.io/kube-openapi v0.21.4
	k8s.io/kube-proxy v0.0.0 => k8s.io/kube-proxy v0.21.4
	k8s.io/kube-scheduler v0.0.0 => k8s.io/kube-scheduler v0.21.4
	k8s.io/kubectl => k8s.io/kubectl v0.21.4
	k8s.io/kubelet v0.0.0 => k8s.io/kubelet v0.21.4
	k8s.io/legacy-cloud-providers v0.0.0 => k8s.io/legacy-cloud-providers v0.21.4
	k8s.io/metrics v0.0.0 => k8s.io/metrics v0.21.4
	k8s.io/mount-utils v0.0.0 => k8s.io/mount-utils v0.21.4
	k8s.io/node-api v0.0.0 => k8s.io/node-api v0.21.4
	k8s.io/repo-infra v0.0.0 => k8s.io/repo-infra v0.21.4
	k8s.io/sample-apiserver v0.0.0 => k8s.io/sample-apiserver v0.21.4
	k8s.io/utils v0.0.0 => k8s.io/utils v0.21.4
	sigs.k8s.io/apiserver-network-proxy/konnectivity-client => sigs.k8s.io/apiserver-network-proxy/konnectivity-client v0.0.22
)
