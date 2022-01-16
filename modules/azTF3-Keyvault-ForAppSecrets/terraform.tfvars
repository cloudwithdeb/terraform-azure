

/*
    (1). Assign values to subscription variable
*/


SUBSCRIPTION = "c59b9197-a8b5-4c1d-9196-b5c8bc9be3cf"



/*
    (2). Assign values to RESOURCE_GROUP
*/


RESOURCE_GROUP = {
  NAME     = "azMystoreKeeperKeyVaultRG",
  LOCATION = "West Europe"
}


/*
    (3). Assign values to azure keyvault
*/


AZURE-KEY-VAULT = {
  NAME                       = "mystorekeeperkeyvault"
  SKU_NAME                   = "standard"
  ENABLE_DISK_ENCRYPTION     = true
  PURGE_PROTECTION_ENABLE    = false
  SOFT_DELETE_RETENTION_DAYS = 7
  TERNANT_ID                 = "1131174f-9293-481a-b2f8-f82fa609bfdf"
}


/*
    (4). Assign values to KEYVAULT-SECRETS
*/


KEYVAULT-SECRETS = {
  SECRETS_KEY   = "mystorekeeper-conn-strings"
  SECRETS_VALUE = "mongodb://mystorekeeperdb-205:fuGcLrksDPwWN0J8qlxdtXqD18mN4QgGG7PC2ZlynzY0tr46rA6wpfldjJuPYEloxruvksamPMYBKhYSdiv7Ow==@mystorekeeperdb-205.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mystorekeeperdb-205@"
}
