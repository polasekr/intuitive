# Custom Data 
locals {
  vm_custom_data = filebase64("${path.module}/from-script.sh")
  custom_data    = var.custom_data_override != "" ? var.custom_data_override : local.vm_custom_data
}

resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  count = var.vm-count

  name                  = "linuxvm-${count.index}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.vm_username
  network_interface_ids = [element(var.nics, count.index)]
  admin_ssh_key {
    username   = var.vm_username
    public_key = file("${path.module}/ssh-keys/vm-ssh.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }

  custom_data = base64encode(local.custom_data)
}
