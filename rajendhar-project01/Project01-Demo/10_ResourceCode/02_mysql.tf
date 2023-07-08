
resource "azurerm_mysql_server" "create-mysql" {
  name                              = "webapps-mysql-rajendhardemo01"
  location                          = azurerm_resource_group.create-rg.location
  resource_group_name               = azurerm_resource_group.create-rg.name
  administrator_login               = "sqladmin"
  administrator_login_password      = "12Rajendhar!@"
  sku_name                          = "GP_Gen5_2"
  storage_mb                        = 5120
  version                           = "5.7"
  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"

  tags                              = local.tags
}

resource "azurerm_mysql_database" "mysqldb" {
  name                = "mysqldb"
  resource_group_name = azurerm_resource_group.create-rg.name
  server_name         = azurerm_mysql_server.create-mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}