terraform {
  required_version = ">= 0.13"

  required_providers {
    github = {
      source  = "github"
      version = "< 5.0"
    }
  }
}
