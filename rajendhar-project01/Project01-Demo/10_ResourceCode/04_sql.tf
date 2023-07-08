
resource "azurerm_sql_server" "create-sql" {
  name                         = "webapps-sql-rajendhardemo01"
  resource_group_name          = azurerm_resource_group.create-rg.name
  location                     = azurerm_resource_group.create-rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "12Rajendhar!@"

  tags                         = local.tags
}

resource "azurerm_sql_database" "example" {
  name                = "sqldatabase"
  resource_group_name = azurerm_resource_group.create-rg.name
  location            = azurerm_resource_group.create-rg.location
  server_name         = azurerm_sql_server.create-sql.name
}
