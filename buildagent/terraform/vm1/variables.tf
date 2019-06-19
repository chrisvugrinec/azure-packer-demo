variable "hostname" {
  default = "buildagent1"
}
variable "vm_size" {
  default = "Standard_DS3_v2"
}
variable "static_ip" {
  default = "10.0.2.5"
}

variable "pat" {}
variable "ssh" {}
variable "rg" {}
variable "vnet" {}
variable "subnet" {}
variable "keyvault" {}
