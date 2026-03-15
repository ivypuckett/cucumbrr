terraform {
  required_version = ">= 1.6"

  required_providers {
    fly = {
      source  = "fly-apps/fly"
      version = "~> 0.0.23"
    }
  }

  # Uncomment to store state remotely (recommended for teams)
  # backend "s3" {
  #   bucket = "your-tf-state-bucket"
  #   key    = "cucumbrr/tofu.tfstate"
  #   region = "us-east-1"
  # }
}

provider "fly" {
  # Reads FLY_API_TOKEN from environment automatically
}

resource "fly_app" "cucumbrr" {
  name = var.app_name
  org  = var.org_slug
}

# Persistent volume for PocketBase data (SQLite DB, uploads, etc.)
resource "fly_volume" "data" {
  app    = fly_app.cucumbrr.name
  name   = "${var.app_name}_data"
  size   = var.volume_size_gb
  region = var.region

  depends_on = [fly_app.cucumbrr]
}

resource "fly_ip" "ipv4" {
  app  = fly_app.cucumbrr.name
  type = "v4"

  depends_on = [fly_app.cucumbrr]
}

resource "fly_ip" "ipv6" {
  app  = fly_app.cucumbrr.name
  type = "v6"

  depends_on = [fly_app.cucumbrr]
}
