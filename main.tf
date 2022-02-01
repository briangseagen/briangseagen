#================================================================================================
# Tags
# #================================================================================================
locals {
  tags = {
    department     = var.department
    business_owner = var.business_owner
    ptso           = var.ptso
  }
}

#================================================================================================
# Create a Resource Group
#================================================================================================
resource "azurerm_resource_group" "rg" {
  name     = "${var.default_region}-${var.environment}-${var.app_name}-rg" // Need to add app_name to Terraform Cloud Workspace variables
  location = var.default_region
  tags     = local.tags
}

#================================================================================================
# Create a The Function in Azure
#================================================================================================
module "functionapp" {
  source               = "app.terraform.io/Seagen/functionapp/azurerm"
  version              = "0.0.2"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = var.default_region
  storage_account_name = var.storage_account_name
  service_plan_name    = var.service_plan
  function_app_name    = var.app_name
  repo_url             = "https://github.com/Seagen/BrianAZR"
  branch               = "development"
  token                = var.gh_token
  tags                 = local.tags
}

#================================================================================================
# Create an Event Grid in Azure
#================================================================================================
// This will be its own module soon