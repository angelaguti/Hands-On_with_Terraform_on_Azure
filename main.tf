terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  required_version = "1.14.8"

  cloud {

    organization = "angela_tester"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-d62c873f-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage" {
  source  = "app.terraform.io/angela_tester/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "9urehjijvojspievj"
  environment = "Production"
}