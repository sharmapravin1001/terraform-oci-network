variable "project_id" {  
default = "stellar-lock-347017"
type = string
}

variable "network_name" {
default = "greenfield-vpc"
}

variable "region" {
default = "us-central1"
type = string
}

variable "project_name" {
default = "pravin-vpc"
type = string
}

variable "auto_create_subnetworks" {
type        = bool
default     = false
}

variable "subnet_cidr" {
type = string
default = "10.10.0.0/24"
}

variable "pod_range" {
default = "greenfield-pod"
type = string
}

variable "pod_cidr" {
type = string
default = "10.20.0.0/24"
}

variable "service_range" {
default = "greenfield-service"
type = string
}

variable "service_cidr" {
type = string
default = "10.30.0.0/24"
}

variable "env_name" {
default = "dev"
type = string
}

variable "subnet_name" {
default = "greenfield-subnet"
type = string
}


variable "cluster_name" {
default = "greenfield-cluster"
type = string
}


