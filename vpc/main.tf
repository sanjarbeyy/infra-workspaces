terraform {
  cloud {
    organization = "sanjarbey"

    workspaces {
      name = "infra-vpc"
    }
  }
}