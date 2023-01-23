# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "example" {
#   name                = "ccseyhankeys1234"
#   location            = azurerm_resource_group.rg1.location
#   resource_group_name = azurerm_resource_group.rg1.name
#   tenant_id           = data.azurerm_client_config.current.tenant_id
#   sku_name            = "standard"

#   purge_protection_enabled = true
# }

# resource "azurerm_key_vault_access_policy" "storage" {
#   key_vault_id = azurerm_key_vault.example.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = azurerm_storage_account.example.identity.0.principal_id

#   key_permissions    = ["Get", "Create", "List", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
#   secret_permissions = ["Get"]
# }

# resource "azurerm_key_vault_access_policy" "client" {
#   key_vault_id = azurerm_key_vault.example.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = data.azurerm_client_config.current.object_id

#   key_permissions    = ["Get", "Create", "Delete", "List", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
#   secret_permissions = ["Get"]
# }


# resource "azurerm_key_vault_key" "example" {
#   name         = "tfex-key"
#   key_vault_id = azurerm_key_vault.example.id
#   key_type     = "RSA"
#   key_size     = 2048
#   key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]

#   depends_on = [
#     azurerm_key_vault_access_policy.client,
#     azurerm_key_vault_access_policy.storage,
#   ]
# }


# resource "azurerm_storage_account" "example" {
#   name                     = "ccseyhan12345"
#   resource_group_name      = azurerm_resource_group.rg1.name
#   location                 = azurerm_resource_group.rg1.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

#   identity {
#     type = "SystemAssigned"
#   }
# }

# resource "azurerm_storage_account_customer_managed_key" "example" {
#   storage_account_id = azurerm_storage_account.example.id
#   key_vault_id       = azurerm_key_vault.example.id
#   key_name           = azurerm_key_vault_key.example.name
# }

# resource "azurerm_storage_share" "example" {
#   name                 = "sharename"
#   storage_account_name = azurerm_storage_account.example.name
#   quota                = 50
# }
