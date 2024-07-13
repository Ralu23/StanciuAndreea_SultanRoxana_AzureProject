terraform {
  required_providers {
    azurerm ={
    source = "hashicorp/azurerm"
    version = ">=3.0"
    }
  }
  backend "azurerm" {
    subscription_id     = "65fed392-98d6-4bb6-a2bc-368b2f91cdcb"
    resource_group_name = "rg-terraform"
    storage_account_name = "stterraformdevv"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

  provider"azurerm" {
  features {}
}
