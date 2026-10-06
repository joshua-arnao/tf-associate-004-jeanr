resource "azurerm_storage_account" "demo_storage_terraform" {
  name                     = "demosttf"
  resource_group_name      = "demo-terraform"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

