# Learn Terraform Provisioning

This sample is originally based on a hashicorp tutorial. See: 
https://learn.hashicorp.com/tutorials/terraform/packer?in=terraform/provision

The source code was originally cloned from: https://github.com/hashicorp/learn-terraform-provisioning

Companion code repository for learning to provision Terraform instances with Packer

Follow along on the [HashiCorp Learn platform](https://learn.hashicorp.com/tutorials/terraform/packer?in=terraform/provision)


## Steps

1. Create ssh key
```shell
$ ssh-keygen -t rsa -C "your_email@example.com" -f ./.ssh/tf-packer
```   
2. Packer it
```shell
$ cd images
$ packer build image.pkr.hcl
```
3. Terraform it
```shell
$ cd instances
$ terraform init
$ terrform apply
```
4. Start the application
```shell
$ ssh terraform@$(terraform output -raw public_ip) -i ../.ssh/tf-packer
$ cd go/src/github.com/hashicorp/learn-go-webapp-demo
$ go run webapp.go
```
5. Destroy it all
```shell
$ terraform destroy
```

## Links

Searching and finding images
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami