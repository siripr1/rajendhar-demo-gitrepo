
# Code for sql server creation
resource "azurerm_mssql_server" "create-mssql" {
  name                         = "webapps-mssql-rajendhardemo01"
  resource_group_name          = azurerm_resource_group.create-rg.name
  location                     = azurerm_resource_group.create-rg.location
  version                      = "12.0"
  minimum_tls_version          = "1.2"
  administrator_login          = "sqladmin"
  administrator_login_password = "12Rajendhar!@"

  tags                         = local.tags
}

#Code for sql database creation
resource "azurerm_mssql_database" "create-database" {
  name           = "webapps-database01"
  server_id      = azurerm_mssql_server.create-mssql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 10
  sku_name       = "GP_Gen5_2"
}
