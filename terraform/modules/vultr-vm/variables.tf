variable "ssh_admin_key" {
  type        = string
  description = "public ssh key to add to the instance"
}

variable "ssh_admin_key_label" {
  type        = string
  description = "vultr label for the added ssh key"
}

variable "vultr_api_key" {
  type        = string
  description = "vultr api authentication key"
}

variable "vultr_dns_domain_id" {
  type        = string
  description = "vultr id of the dns domain"
}

variable "vm_hostname" {
  type        = string
  description = "hostname for the vultr instance"
}

variable "vm_os_id" {
  type        = string
  description = "vultr id for the os to install on the instance"
}

variable "vm_plan" {
  type        = string
  description = "vultr vm plan id for the instance"
}

variable "vm_region" {
  type        = string
  description = "vultr vm region id for the instance"
}
