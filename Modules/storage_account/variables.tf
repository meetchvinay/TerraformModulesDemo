variable "env" {
    type = string  
}

variable "resource_group" {
    type = string  
}

variable "location" {
    type = string  
}

variable "storage_account_count" {
    type = number  
}

variable "name_prefix" {
    type = string  
}

variable "tags" {
    type = map(string)  
    default = {}
}