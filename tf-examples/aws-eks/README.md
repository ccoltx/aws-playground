# aws-eks

Deploy an EKS cluster using Terraform.

## Deploy EKS Cluster

### Introduction

This example originally followed: https://learn.hashicorp.com/tutorials/terraform/eks
It was originally cloned from: https://github.com/hashicorp/learn-terraform-provision-eks-cluster
Thank you to Hashicorp for providing this tutorial.

It has been modified to fit my needs

### Prerequisites

1. AWS CLI
   If you've got here, it should already be installed. Otherwise check out [here](../../README.md#Install and configure AWS CLI)
2. AWS IAM Authenticator
   ```shell
   $ brew install aws-iam-authenticator
   ```

## Deploy Kubernetes Dashboard

### Prerequisites

1. kubectl
   ```shell
   $ brew install kubernetes-cli
   ```

### Configure kubectl
```shell
$ aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

### Deploy metrics-server
```shell
$ kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
$ kubectl get deployment metrics-server -n kube-system
```

### Deploy dashboard
```shell
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml
$ kubectl proxy
```
This version may not be compatible with the currently EKS kubernetes version. In which case, install an older version.

### Authenticate to dashboard
```shell
$ kubectl apply -f kubernetes-dashboard-admin.rbac.yaml
$ kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')
```

Open the Kubernetes dashboard [here](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)

Copy and paste the token into the dashboard authentication screen to sign in.


------

## Registry

TODO: Create a container registry (ECR).

## Links

https://www.eksworkshop.com/intermediate/280_backup-and-restore/backup-restore/