terraform {
  required_version = ">=1.1.2, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.85.0"
    }
  }

  # backend "remote" {
  #   organization = "Seagen"

  #   workspaces {
  #     prefix = "BrianAZR-"
  #   }
  # }

}

provider "azurerm" {
  features {}
}
