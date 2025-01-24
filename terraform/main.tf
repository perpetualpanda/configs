terraform {
  required_version = ">= 1.10"

  backend "remote" {
    organization = "perpetualpanda"

    workspaces {
      name = "infra"
    }
  }
}

resource "vultr_dns_domain" "root" {
  domain = "ppanda.org"
}

locals {
  offworld_hostname = "offworld.${vultr_dns_domain.root.domain}"
}

module "vultr_offworld_instance" {
  source = "github.com/perpetualpanda/tf-modules/vultr-vm"

  vm_hostname = local.offworld_hostname
  vm_os_id    = "2076"            # alpine linux
  vm_plan     = "vc2-1c-0.5gb-v6" # lowest spec plan
  vm_region   = "ewr"             # new jersey (plan available only in ewr)

  block_storage_label = "offworld-block-storage"
  block_storage_gb    = 1

  ssh_admin_key_label = "offworld-admin-ssh-key"
  ssh_admin_key       = var.admin_ssh_key

  vultr_dns_domain_id = vultr_dns_domain.root.id
  vultr_api_key       = var.vultr_api_key
}
