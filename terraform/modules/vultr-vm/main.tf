terraform {
  required_version = ">= 1.10"
}

locals {
  subdomain = regex("(.*)\\.[a-z]*\\.[a-z]*", var.vm_hostname)[0]
}

resource "vultr_ssh_key" "admin_key" {
  name    = var.ssh_admin_key_label
  ssh_key = var.ssh_admin_key
}

resource "vultr_instance" "service_vm" {
  backups     = "disabled"
  enable_ipv6 = false
  hostname    = var.vm_hostname
  label       = var.vm_hostname
  os_id       = var.vm_os_id
  plan        = var.vm_plan
  region      = var.vm_region
  ssh_key_ids = [vultr_ssh_key.admin_key.id]
}

resource "vultr_dns_record" "vm_hostname_record" {
  domain = var.vultr_dns_domain_id
  name = local.subdomain
  data = vultr_instance.service_vm.main_ip
  ttl  = 300
  type = "A"
}
