terraform {
  required_providers {
    azurerm ={
source = "hashicorp/azurerm"
version = ">=3.0"

    }
  }
  backend "azurerm" {
    subscription_id = "value"
    storage_account_name = "terraform"
    resource_group_name = "terraformstateproj"
    container_name = "terraform"
    key = "terraform.tfstate"
    use_azuread_auth = true
    
  }

}
  provider"azurerm" {
  features {}
}
