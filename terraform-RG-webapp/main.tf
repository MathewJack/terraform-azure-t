resource "azurerm_resource_group" "webrg" {
  location = var.resource_group_location
  name     = var.resource_group_name_prefix
}

resource "azurerm_service_plan" "prime-no" {
  name = "prime-no-web-plan"
  location = var.resource_group_location
  resource_group_name = azurerm_resource_group.webrg.name
  os_type = "Linux"
  sku_name = "B1"
  depends_on = [ azurerm_resource_group.webrg ]
}

resource "azurerm_linux_web_app" "prime-no-app" {
  name = "prime-no-app"
  location = var.resource_group_location
  resource_group_name = azurerm_resource_group.webrg.name
  service_plan_id = azurerm_service_plan.prime-no.id
  site_config {
    minimum_tls_version = "1.2"
    always_on = false
  }
  depends_on = [ azurerm_service_plan.prime-no, azurerm_resource_group.webrg ]
}