terraform {
  cloud {
    organization = "sanjarbey"

    workspaces {
      name = "infra-ec2"
    }
  }
}