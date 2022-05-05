resource "oci_core_security_list" "sl" {
    compartment_id = var.root_compartment_id
    vcn_id = oci_core_vcn.pravinvcn.id
    display_name = "sl-29"
    
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "6"
    }

    dynamic "ingress_security_rules" {
        for_each = var.pravin-ports
        content {
            protocol = "6"
            source = "0.0.0.0/0"
            tcp_options {
                max = ingress_security_rules.value
                min = ingress_security_rules.value
            }
        }
    }
}

resource "oci_core_subnet" "okeworkerSubnetAD1" {
  cidr_block        = "lookup(var.oke_network_cidrs, okeworkerSubnetAD1)"
  compartment_id    = "var.root_compartment_id}"
  security_list_ids = [oci_core_security_list.sl.id]
  vcn_id            = "oci_core_vcn.pravinvcn.id}"
  display_name        = "okeworkerSubnetAD1"
  dns_label           = "okeworker1"
  route_table_id      = "oci_core_route_table.rt.id"
  }
  
resource "oci_core_subnet" "okeworkerSubnetAD2" {
  cidr_block        = "lookup(var.oke_network_cidrs, okeworkerSubnetAD2)"
  compartment_id    = "var.root_compartment_id"
  security_list_ids = [oci_core_security_list.sl.id]
  vcn_id            = "oci_core_vcn.pravinvcn.id"
  display_name        = "okeworkerSubnetAD2"
  dns_label           = "okeworker2"
  route_table_id      = "oci_core_route_table.rt.id"
  }
  

resource "oci_core_subnet" "okeworkerSubnetAD3" {
  cidr_block        = "lookup(var.oke_network_cidrs, okeworkerSubnetAD3)"
  compartment_id    = "var.root_compartment_id"
  security_list_ids = [oci_core_security_list.sl.id]
  vcn_id            = "oci_core_vcn.pravinvcn.id"
  display_name        = "okeworkerSubnetAD3"
  dns_label           = "okeworker3"
  route_table_id      = "oci_core_route_table.rt.id"
  }


resource "oci_core_subnet" "okeLBSubnetAD1" {
  cidr_block        = "lookup(var.oke_network_cidrs, okeLBSubnetAD1)"
  compartment_id    = "var.root_compartment_id"
  security_list_ids = [oci_core_security_list.sl.id]
  vcn_id            = "oci_core_vcn.pravinvcn.id"
  availability_domain = "lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], name)"
  dhcp_options_id     = "oci_core_vcn.oke_vcn.default_dhcp_options_id"
  display_name        = "okeLBSubnetAD1"
  dns_label           = "okeloadbalancer1"
  route_table_id      = "oci_core_route_table.rt.id"
}

resource "oci_core_subnet" "LBSubnetAD2" {
  #Required
  cidr_block        = "lookup(var.oke_network_cidrs, okeLBSubnetAD2)"
  compartment_id    = "var.root_compartment_id"
  security_list_ids = ["oci_core_security_list.sl.id"]
  vcn_id            = "oci_core_vcn.pravinvcn.id"
  availability_domain = "lookup(data.oci_identity_availability_domains.ADs.availability_domains[1], name)"
  dhcp_options_id     = "oci_core_vcn.oke_vcn.default_dhcp_options_id"
  display_name        = "okeLBSubnetAD2"
  dns_label           = "okeloadbalancer2"
  route_table_id      = "oci_core_route_table.rt.id"
}
