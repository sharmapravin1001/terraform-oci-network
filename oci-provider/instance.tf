data "oci_core_images" "ubuntu-18-04" {
  compartment_id = var.root_compartment_id
  operating_system = "Canonical Ubuntu"
  filter {
    name = "display_name"
    values = ["^Canonical-Ubuntu-18.04-([\\.0-9-]+)$"]
    regex = true
  }
}

output "ubuntu-18-04-latest-id" {
  value = data.oci_core_images.ubuntu-18-04.images.0.id
}

# Resources
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.root_compartment_id
}

resource "oci_core_instance" "pravin_instance" {
  # Required
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.root_compartment_id
  shape               = var.instance_shape
  source_details {
    source_id         =  var.worker_ol_image_name
    source_type       = "image"
  }

create_vnic_details {
    subnet_id = oci_core_subnet.subnet1.id
    assign_public_ip = true
  }
    metadata = {
        ssh_authorized_keys = file("absolute_path_of your public key -  .pub file")
    } 
    preserve_boot_volume = false

}

/*
data "oci_identity_availability_domains" "list_ad" {
    compartment_id = var.root_compartment_id
}

output "show_ads" {
  value = data.oci_identity_availability_domains.list_ad
}

resource "oci_core_instance" "test_instance" {
    availability_domain = data.oci_identity_availability_domain.list_ad.[0].id
    compartment_id = var.root_compartment_id
    shape = var.instance_shape
    
}
*/
