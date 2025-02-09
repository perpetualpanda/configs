###################
# Local Variables #
###################

locals {
  root_domain       = "ppanda.org"
  offworld_hostname = "offworld.${local.root_domain}"
}

####################
# Virtual Machines #
####################

module "vultr_instance_offworld" {
  source = "github.com/perpetualpanda/tf-modules/vultr-vm"

  vm_hostname = local.offworld_hostname
  vm_os_id    = "2076"         # alpine linux
  vm_plan     = "vc2-1c-0.5gb" # low spec plan
  vm_region   = "ewr"          # plan available in new jersey region

  block_storage_label = "offworld-block-storage"
  block_storage_gb    = 1

  ssh_admin_key_label = "offworld-admin-ssh-key"
  ssh_admin_key       = var.admin_ssh_key

  vultr_dns_domain_id = vultr_dns_domain.root.id
  vultr_api_key       = var.vultr_api_key
}

resource "ansible_playbook" "ansible_playbook_offworld" {
  name = local.offworld_hostname
  playbook = "../ansible/main.yml"
}
