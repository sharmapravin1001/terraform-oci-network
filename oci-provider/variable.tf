variable "tenancy_ocid" {
	default=""
	description="OCI Tenancy Registered and provide the Tenancy OCID -- No worries" 
}

variable "user_ocid"  {
	default = ""
}

variable "private_key_path" {
	default = "provide_your_full_path_of_oci_api_key.pem file"
}

variable "ssh_public_key_file" {
  default = ""
}

variable "fingerprint"  {
	default = ""
}

variable "ad_number" {
    default = "1"
}

variable "region" {
	default = "us-phoenix-1"
}

variable "root_compartment_id" {
	default = ""
}

variable  "label_prefix" {
	default = "none"
}

/*
variable "tags" {
  #! Deprecation notice: will be renamed to freeform_tags at next major release
  description = "simple key-value pairs to tag the resources created using freeform tags."
  type        = map(any)
  default = {
    environment = "pravin-29"
    project  = "sre-29"
  }
}
*/

variable "instance_shape" {
    default = "VM.Standard2.1"
}


variable "vcn_name" {
  description = "user-friendly name of to use for the vcn to be appended to the label_prefix"
  type        = string
  default  = "pravin-29"
}

variable "vcn_dns_label" {
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet"
  type        = string
  default =  "pravin-sre"
}

variable "vcn_cidr" {
  description = "cidr block of VCN"
  default     = "10.0.0.0/16"
  type        = string
}

variable "sub_cidr" {
  default     = "10.0.1.0/24"
  }

variable "internet_gateway_enabled" {
  type = bool
  default = "true"
}

variable "pravin-ports" {
  default = [22,80,443]
}

variable "worker_ol_image_name" {
  default = "Oracle-Linux-8"
}

# oke
variable "oke_cluster" {
  type = map
 
  default = {
    name             = "oke_cluster"
    version          = "v1.20.8"
    shape            = "VM.Standard.E2.1.Micro"
    nodes            = 1 
  }
}

variable "oke_network_cidrs" {
  type = map
   default = {
    vcnCIDR               = "10.0.0.0/16"
    workerSubnetAD1       = "10.0.10.0/26"
    workerSubnetAD2       = "10.0.11.0/26"
    workerSubnetAD3       = "10.0.12.0/26"
    LBSubnetAD1 = "10.0.20.0/26"
    LBSubnetAD2 = "10.0.21.0/26"
    LBSubnetAD3 = "10.0.22.0/26"
  }
}
