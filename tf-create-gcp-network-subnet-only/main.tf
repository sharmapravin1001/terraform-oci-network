resource "google_compute_network" "greenfield-vpc" {
  name                            = "${var.network_name}-${var.env_name}"
  project                         = var.project_id
  auto_create_subnetworks         = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "greenfield-subnet" {
  name 		= "${var.subnet_name}-public-${var.env_name}"
  project 	= var.project_id
  region  	= var.region
  network 	= google_compute_network.greenfield-vpc.self_link
  ip_cidr_range = var.subnet_cidr
  secondary_ip_range = [
  {
    range_name    = var.pod_range
    ip_cidr_range = var.pod_cidr
    },
    {
    range_name    = var.service_range
    ip_cidr_range = var.service_cidr
    },
    ]
}



