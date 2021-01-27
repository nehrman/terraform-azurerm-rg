# Azure Resource Group Module

A Terraform module which creates Resource Group on Azure with the following characteristics:
- Create Virtual Network
- Create one or many Subnets in the Virtual Network
- Create a Storage Account and ensuring the name is in lower case

## Terraform versions

If you are using Terraform 0.12 you can use versions `v2.*`.

If you are using Terraform 0.11 you can use versions `v1.*`.

## Usage

Resource Group Creation example: 

```hcl
module "rg" {
  source                     = "app.terraform.io/<ORG_NAME>/rg/azurerm"
  version                    = "1.0.0"
  tf_az_name                 = "demo"
  tf_az_env                  = "dev"
  tf_az_location             = "westeurope"
  tf_az_net_addr_space       = "10.0.0.0/16"
  tf_az_subnet_prefixes      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  tf_az_subnet_names         = ["subnet1", "subnet2", "subnet3"]
  tf_az_storage_account_name = "devdemosa"

  tf_az_tags = {"env"="dev", "owner"="me"}
}
```

## Authors

* **Nicolas Ehrman** - *Initial work* - [Hashicorp](https://www.hashicorp.com)



