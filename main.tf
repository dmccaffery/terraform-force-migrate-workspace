resource "null_resource" "example" {}

terraform {
  required_version = "~> 1.0"

  backend "local" {
  }

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}
