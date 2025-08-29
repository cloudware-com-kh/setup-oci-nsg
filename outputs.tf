# Output NSG information
output "nsg_id" {
  description = "The NSG ID being managed"
  value       = var.nsg_id
}

output "nsg_display_name" {
  description = "Display name of the NSG"
  value       = data.oci_core_network_security_group.target_nsg.display_name
}

output "ingress_rule_created" {
  description = "Details of the ingress rule created"
  value = {
    id          = oci_core_network_security_group_security_rule.ingress_rule.id
    source      = oci_core_network_security_group_security_rule.ingress_rule.source
    port        = var.ingress_port
    description = oci_core_network_security_group_security_rule.ingress_rule.description
  }
}

output "egress_rules_created" {
  description = "Map of egress rules created"
  value = {
    for name, rule in oci_core_network_security_group_security_rule.egress_rules :
    name => {
      id          = rule.id
      destination = rule.destination
      port        = var.egress_port
      description = rule.description
    }
  }
}

output "total_rules_managed" {
  description = "Total number of security rules managed by this module"
  value       = 1 + length(oci_core_network_security_group_security_rule.egress_rules)
}
