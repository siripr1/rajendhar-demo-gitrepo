# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "raj-example" {
  name     = "${var.prefix}-resources"
  location = var.location
}

# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "raj-example" {
  name                = "${var.prefix}-cache"
  location            = azurerm_resource_group.create-rg.location
  resource_group_name = azurerm_resource_group.create-rg.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {}
}