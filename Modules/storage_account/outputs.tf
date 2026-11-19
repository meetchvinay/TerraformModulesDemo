output "storage_account_names" {
    value = azurerm_storage_account.sa[*].name  
}

output "storage_account_ids" {
    value = azurerm_storage_account.sa[*].id  
}