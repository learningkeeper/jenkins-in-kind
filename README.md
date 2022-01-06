# Jenkins in Kubernetes
This repository is a POC for setting up a simple HA Jenkins  running in Kubernetes by using kind.

**Prerequisite**

`Please install helm, kind, docker first`



# The repo is running jenkins in k8s by using kind


### For HA purpose in reality, please use 2 more replicas and pod antiaffinity to run in different nodes. Please refer to the jenkins-tailored-values.yaml 

### Given the conditions of using persist volume in cloud, it is better to some GCP storageClass in PVC.
https://kubernetes.io/docs/concepts/storage/storage-classes/

##  how to run the POC

`bash -x bootstrap.sh`



