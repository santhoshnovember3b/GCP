# Configure the Google Cloud Provider 12 
provider "google" {
  project = "project-faa78c35-c74f-48b6-84a" # Replace with your GCP Project ID
  region  = "us-central1"
}

# Create the VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "dev-vpc"
  auto_create_subnetworks = false # Crucial for production; lets you define your own subnets
  description             = "Custom VPC created via Terraform"
}

# Create a Subnet within the VPC
resource "google_compute_subnetwork" "subnet" {
  name          = "dev-us-central1-subnet"
  ip_cidr_range = "10.20.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id

  # Enables Google private access for instances without public IPs
  private_ip_google_access = true 
}

# Create the VPC Networkq
resource "google_compute_network" "vpc_network" {
  name                    = "prod-vpc"
  auto_create_subnetworks = false # Crucial for production; lets you define your own subnets
  description             = "Custom VPC created via Terraform"
}

# Create a Subnet within the VPC
resource "google_compute_subnetwork" "subnet" {
  name          = "prod-us-central1-subnet"
  ip_cidr_range = "10.30.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id

  # Enables Google private access for instances without public IPs
  private_ip_google_access = true 
}

# Create the VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "shared-vpc"
  auto_create_subnetworks = false # Crucial for production; lets you define your own subnets
  description             = "Custom VPC created via Terraform"
}

# Create a Subnet within the VPC
resource "google_compute_subnetwork" "subnet" {
  name          = "shared-us-central1-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id

  # Enables Google private access for instances without public IPs
  private_ip_google_access = true 
}

