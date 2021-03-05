# aws-terraform

This is my project to learn and explore terraform (in AWS to start).

## Installation and Configuration

### Terraform

Follow the instructions here: https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started

```shell
$ brew tap hashicorp/tap
$ brew install hashicorp/tap/terraform
```

To update
```shell
$ brew upgrade hashicorp/tap/terraform
```

### AWS
#### Create a IAM User

:warning: Don´t use your AWS root account!

If not already done, create an IAM User.

Go to https://console.aws.amazon.com/iam/ and add a new User. Create access key.


#### Install and configure AWS CLI

Follow the instructions here: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

https://formulae.brew.sh/formula/awscli

````shell
brew install awscli
````

* Configure the AWS CLI with credentials, so it can access the API
    ```shell
    aws configure
    ```
* get the **_AWS Access Key ID_** and **_AWS Secret Access Key_** for the IAM user from the formerly created IAM user
* choose an appropriate supported region
  * (https://docs.aws.amazon.com/general/latest/gr/rande.html)
  * I use Europe (Frankfurt), so use **_eu-central-1_**
* use default output format **_json_**


## Examples

[Here](tf-examples) are the Terraform examples.