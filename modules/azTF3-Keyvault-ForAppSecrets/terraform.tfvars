

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


KEYVAULT-SECRETS-MONGODB-URL = {
  SECRETS_KEY   = "mystorekeeper-conn-strings"
  SECRETS_VALUE = "mongodb://mystorekeeperdb-205:fuGcLrksDPwWN0J8qlxdtXqD18mN4QgGG7PC2ZlynzY0tr46rA6wpfldjJuPYEloxruvksamPMYBKhYSdiv7Ow==@mystorekeeperdb-205.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mystorekeeperdb-205@"
}


/*
    (5). Assign algorithm used to generate users token on login
*/

KEYVAULT-SECRETS-ALGORITHM = {
  SECRETS_KEY   = "algorithm"
  SECRETS_VALUE = "HS256"
}


/*
    (6). Assign secrets value to generate users token on login
*/

KEYVAULT-SECRETS-SECRETS-KEY = {
  SECRETS_KEY   = "secret-key"
  SECRETS_VALUE = "be523d459c62cd420f6093dd6afe11c2784e8c32d7ccb39ece53008534c5c4f5"
}


/*
    (7). Assign expired date value to generate users token on login
*/

KEYVAULT-SECRETS-EXPIRED-DATE = {
  SECRETS_KEY   = "expired-date"
  SECRETS_VALUE = 1440
}
