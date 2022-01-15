

/*
    (1). Assign values to subscription variable
*/


SUBSCRIPTION = "c59b9197-a8b5-4c1d-9196-b5c8bc9be3cf"


/*
    (2). Assign values to STORAGE-ACCOUNT-NAMES
*/


STORAGE-ACCOUNT-LOGS-IMAGEUPLOAD-NAMES = "mystorekeeperimglogs"


/*
    (3). Assign values to storage account containers
*/


IMAGE-LOGS-STORAGE-ACCOUNT = [
  "dev-imageuploads",
  "test-imageuploads",
  "prod-imageuploads"
]


/*
    (4). Assign values to RESOURCE_GROUP
*/


RESOURCE_GROUP = {
  NAME     = "azMystoreKeeperImageUploadsLogsRG",
  LOCATION = "West Europe"
}
