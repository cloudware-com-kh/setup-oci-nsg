# Data source to verify NSG exists
data "oci_core_network_security_group" "target_nsg" {
  network_security_group_id = var.nsg_id
}

# Create ingress rule for the specified CIDR
resource "oci_core_network_security_group_security_rule" "ingress_rule" {
  network_security_group_id = var.nsg_id
  direction                 = "INGRESS"
  protocol                  = var.protocol

  source      = var.ingress_cidr
  source_type = "CIDR_BLOCK"

  tcp_options {
    destination_port_range {
      min = var.ingress_port
      max = var.ingress_port
    }
  }

  description = "Allow ${var.protocol == "6" ? "TCP" : var.protocol == "17" ? "UDP" : "ICMP"} ingress from ${var.ingress_cidr} on port ${var.ingress_port}"
}

# Create egress rules for each CIDR
resource "oci_core_network_security_group_security_rule" "egress_rules" {
  for_each = var.egress_cidrs

  network_security_group_id = var.nsg_id
  direction                 = "EGRESS"
  protocol                  = var.protocol

  destination      = each.value
  destination_type = "CIDR_BLOCK"

  tcp_options {
    destination_port_range {
      min = var.egress_port
      max = var.egress_port
    }
  }

  description = "Allow ${var.protocol == "6" ? "TCP" : var.protocol == "17" ? "UDP" : "ICMP"} egress to ${each.key} (${each.value}) on port ${var.egress_port}"
}
