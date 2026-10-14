provider "azurerm" {
  features {

  }
}

locals {
  resource_group_name = "demo-terraform"
  localtion           = "eastus"
}

resource "azurerm_virtual_network" "lab" {
  name                = "lab-network"
  address_space       = ["10.0.0.0/16"]
  location            = local.localtion
  resource_group_name = local.resource_group_name
}

resource "azurerm_subnet" "lab" {
  name                 = "default"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.lab.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "nic"
  location            = local.localtion
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.lab.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "hcta-qw-vm"
  location              = local.localtion
  resource_group_name   = local.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_D15_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
