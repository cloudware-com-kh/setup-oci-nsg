# Minimal NSG Management Project

A minimal Terraform project for managing Oracle Cloud Infrastructure (OCI) Network Security Group (NSG) rules.

## Features

1. **Manual NSG ID**: Specify the exact NSG ID you want to manage
2. **CIDR Management**: Add multiple ingress and egress CIDR blocks with descriptive names
3. **Single NSG Focus**: Updates only one specified NSG

## Quick Start

1. Copy the example configuration:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your values:
   - Replace OCIDs with your actual tenancy, user, compartment, and NSG IDs
   - Update CIDR blocks with your allowed sources/destinations
   - Adjust ports and protocols as needed

3. Initialize and apply:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Configuration

### Required Variables

- `tenancy_id`: Your OCI tenancy OCID
- `user_id`: Your OCI user OCID
- `compartment_id`: Compartment OCID where the NSG resides
- `nsg_id`: The specific NSG OCID to manage

### Optional Variables

- `region`: OCI region (default: ap-singapore-1)
- `ingress_port`: Port for ingress rules (default: 6443)
- `egress_port`: Port for egress rules (default: 443)
- `protocol`: Protocol number (default: "6" for TCP)

## Examples

### Database Access Rules
```hcl
egress_cidrs = {
  "primary_db"   = "10.1.1.10/32"
  "backup_db"    = "10.1.2.10/32"
  "cache_server" = "10.1.3.10/32"
}
```

## Outputs

- `nsg_id`: The NSG ID being managed
- `nsg_display_name`: Display name of the NSG
- `ingress_rules_created`: Details of created ingress rules
- `egress_rules_created`: Details of created egress rules
- `total_rules_managed`: Total count of managed rules

## Notes

- This project manages only security rules, not the NSG itself
- The specified NSG must already exist
- Rules are identified by their CIDR and port combination
- Removing CIDRs from configuration will delete the corresponding rules
