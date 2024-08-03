output "resource_group_name" {
  value = azurerm_resource_group.webrg.name
}
output "resource_group_location" {
  value = azurerm_resource_group.webrg.location
}
output "azurerm_service_plan" {
  value = azurerm_service_plan.prime-no.name
}
output "azurerm_linux_web_app" {
  value = azurerm_linux_web_app.prime-no-app.name
}