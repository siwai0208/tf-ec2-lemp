# **EC2-LEMP by Terraform**

## **About**

Make New EC2 Instanse with following packages
- mysql5.7
- nginx
- php7.3
- [sample-laravel-app](https://github.com/siwai0208/food-app)

## **How to Use**

**1. Make .tfvars file from sample**

    mv terraform.tfvars.sample terraform.tfvars

**2. Set following parameter in terraform.tfvars**

- aws_access_key
- aws_secret_key
- aws_region
- VPCCIDR (default: 10.0.16.0/20)
- SubnetsPUB1CIDR (default: 10.0.16.0/24)
- SubnetsPUB2CIDR (default: 10.0.17.0/24)
- SubnetsPRV1CIDR (default: 10.0.24.0/24)
- SubnetsPRV2CIDR (default: 10.0.25.0/24)
- SSHLocation
- HTTPLocation
- key_name
- InstanceType (default: t2.micro)
- DBUser
- DBPassword
- DBName
- GitUser
- GitEmail
- GitPassword

**3. Run commands using the terraform**

    $ terraform init
    ...
    $ terraform apply
    ...
    Apply complete!