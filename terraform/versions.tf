terraform {
  required_version = ">= 1.10"

  required_providers {
    ansible = {
      version = "1.3.0"
      source  = "ansible/ansible"
    }

    vultr = {
      version = "2.23.1"
      source  = "vultr/vultr"
    }
  }

  backend "remote" {
    organization = "perpetualpanda"

    workspaces {
      name = "infra"
    }
  }
}
