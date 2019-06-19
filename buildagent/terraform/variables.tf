resource "random_string" "random-namespace" {
  length = 10
  special = false
}

variable "location" { default = "australiaeast" }
variable "rg" { default = "devops-rg" }
variable "vnet" { default = "devopsvnet1" }
variable "subnet" { default = "devopssubnet1" }

variable "CLIENT_ID" {}
variable "CLIENT_SECRET" {}
variable "TENANT_ID" {}
variable "PAT" {}
variable "SSH" {}
variable "OBJECT_ID" {}

