## MYSTOREKEEPER

Mystorekeeper is a web based, mobile and desktop application, used to manage organization thats from smaller scale to larger scale. With mystorekeeper, you can manage all user activities, warehouses, shops, sales made and many other functionality.

## AZURE SERVICES USED

* Azure keyvault
* Azure cosmosdb
* Azure container app
* Azure API Management
* Azure storage account
* Azure container registry
* Azure function serverless option

## OTHER EXTERNAL SERVICES

* Terraform
* Python
* Docker
* React

## CLOUD DIAGRAM OF MYSTOREKEEPER

## REQUIREMENT TO DEPLOY RESOURCE

* Register for a new azure account, install azure cli and authenticate using `az login`.
* To effectively deploy each module, change the subscription id in `module/*/terraform.tfvars` to your azure account subscription ID and create a storage account in your account manualy by enabling lock on the storage account.
* Change all backend configurations to your desired configs.
* So in all do the following:

    * az login
    * terraform init
    * terraform validate
    * terraform plan
    * terraform fmt
    * terraform apply -auto-approve

TO successfully destroy your resource, use `terraform destroy -auto-approve` to completely destroy all resources.