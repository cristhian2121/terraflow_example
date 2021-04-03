# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.token
}

terraform {
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "2.4.0"
    }
  }
}

