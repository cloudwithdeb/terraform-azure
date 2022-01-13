### Requirements before deploying the module

* Change the value of the terraform backend configurations
* Change the value of the subscription id in `terraform.tfvars`
* Deploy the module using the folowing commands

    * az login
    * terraform init
    * terraform validate
    * terraform plan
    * terraform fmt
    * terraform apply -auto-approve

* To destroy the resources, use the follwoing command

    * terraform destroy -auto-approve

After you have successfully deploy this module, log into your azure account and copy the connection string and place it inside the variable `VARIABLE_NAME` in `tf2-appconfig` inother to get the connection string in the app configuration.

Lastly, lock your resource group and cosmosdb in your account inother to prevent accidental delation.