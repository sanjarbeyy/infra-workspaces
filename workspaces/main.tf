terraform {
  cloud {
    organization = "sanjarbey"

    workspaces {
      name = "infra-workspaces"
    }
  }
  required_providers {
    tfe = {
      version = "~> 0.49.0"
    }
  }
}

provider "tfe" {
  #token   = var.token
  version = "~> 0.49.0"
}

data "tfe_organization" "sanjarbey" {
  name = "sanjarbey"
}

locals {
  infra-components = [
    "vpc",
    "subnet",
    "ec2"
  ]
  exec_type = "local"
}

resource "tfe_workspace" "test" {
  for_each = toset(local.infra-components)

  name           = "infra-${each.key}"
  organization   = data.tfe_organization.sanjarbey.name
  execution_mode = local.exec_type
}