output "greenfield-vpc" {
  value       = google_compute_network.greenfield-vpc
}

output "greenfield-vpc_name" {
  value       = google_compute_network.greenfield-vpc.name
}

output "greenfield-vpc_id" {
  value       = google_compute_network.greenfield-vpc.id
}

output "greenfield-vpc_self_link" {
  value       = google_compute_network.greenfield-vpc.self_link
}

output "greenfield-subnet" {
  value = google_compute_subnetwork.greenfield-subnet
}