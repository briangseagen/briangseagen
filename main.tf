#================================================================================================
# Tags
#================================================================================================
locals {
  tags = {
    department     = var.department
    business_owner = var.business_owner
    ptso           = var.ptso
  }
}

#================================================================================================
# Random string for Storage Buckets
#================================================================================================
resource "random_string" "random" {
  length  = 6
  upper   = false
  special = false
}

#================================================================================================
# Create a Resource Group
#================================================================================================
resource "azurerm_resource_group" "rg" {
  name     = "${var.app_name}-${var.environment}-rg" // Need to add app_name to Terraform Cloud Workspace variables
  location = var.default_region
  tags     = local.tags
}

#================================================================================================
# Create a The Function in Azure from the Seagen Module
#================================================================================================
module "functionapp" {
  source               = "app.terraform.io/Seagen/functionapp/azurerm"
  version              = "0.0.2"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = var.default_region
  storage_account_name = "${var.storage_account_name}${random_string.random.result}"
  service_plan_name    = var.service_plan
  function_app_name    = "${var.app_name}${random_string.random.result}"
  repo_url             = "https://github.com/briangseagen/briangseagen"
  branch               = "development"
  token                = var.gh_token
  tags                 = local.tags
  depends_on = [
    module.storage,
    azurerm_resource_group.rg
  ]
}

#================================================================================================
# Create a Storage Account from the Seagen Module
#================================================================================================
module "storage" {
  source  = "app.terraform.io/Seagen/storage/azurerm"
  version = "0.0.1"

  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_name = var.storage_account_name
  containers           = ["container01", "container02", "container03"]

  file_shares = [
    { name = "smbfileshare1", quota = 150 },
    { name = "smbfileshare2", quota = 250 }
  ]

  tables = ["table1", "table2"]
  queues = ["queue1", "queue2"]

  tags = local.tags
  depends_on = [
    azurerm_resource_group.rg
  ]
}