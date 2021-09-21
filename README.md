# KubeEdge IpTables

This program can be used in synchronisation with [KubeEdge](http://kubeedge.io) in a High Available Cluster, where the cloudcore
is been executed only one time (Not HA Setup of the KubeEdge Cloudcore).

## Configuration
This program is only written for in cluster usage but a few more points are also needed. This will be configured through
environment variables. The following table contains all keys a description and default values.


| Environment Variable | Description | Default Vaule |
| -------------------- | ----------- | ------------- |
| IP_KUBEEDGE_NAMESPACE | is the kubeedge namespace (default should be kubeedge) | no default value is set |
| IP_KUBEEDGE_CONFIGMAP | is the name of the configmap, which will be created from kubeedge | tunnelport |
| IP_KUBBEDGTE_STREAMPORT | is the streamport, which will be used by the tunnelport | no default value is set |

## Deployment
 An example deployment is given in `deployment/k8s`. You can apply this with the following command:
```bash
kubectl apply -f deployment/k8s
```
