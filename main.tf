provider "google" {
  project     = "dark-arcade-390613"
  credentials = "${file("keygcp.json")}"
  region      = "us-central1"
}

terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "5.8.0"
    }
  }
}

terraform {
  backend "gcs" {
    credentials = "keygcp.json"
    bucket = "aquareladesafio4"
    prefix = "Aquarela/aquadesafio4.tfstate"
  }
}

module "vpc" {
  source = "./vpc"
}

module "gke" {
  source = "./gke"
  vpc_name = module.vpc.vpc_name
  subnet_name = module.vpc.subnet_name
}

