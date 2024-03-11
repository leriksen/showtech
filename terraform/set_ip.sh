export ip=$(terraform show -json | jq -r '.values.root_module.resources[] | select(.address == "azurerm_linux_virtual_machine.aks") | .values.public_ip_addresses[0]')
