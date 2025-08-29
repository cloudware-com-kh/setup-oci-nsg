# Basic OCI Configuration (from original project)
# tenancy_id     = "ocid1.tenancy.oc1..aaaaaaaadnyz2zzso6czqx7aucibtixmgmhhsk3jmp4bybxzv3funjsllb7a"
# user_id        = "ocid1.user.oc1..aaaaaaaa2iwtovhaj6d46f55ofewldspn4gbgzvefhb7hwt7trvhw5qchw5a"
# region         = "ap-singapore-1"
# compartment_id = "ocid1.compartment.oc1..aaaaaaaadn474ataqnjqk4pvu7i4nagnckwlgvdpwv7itshbczqih2x3z5tq"

# NSG Configuration - Replace with your actual NSG OCID
# You can get this from OCI Console > Networking > Virtual Cloud Networks > Your VCN > Network Security Groups
# nsg_id = "ocid1.networksecuritygroup.oc1.ap-singapore-1.aaaaaaaakgehktudtkucr3jfr5s5qnylzodxgxhrewobaqksyrou3vykk2mq"

# Ingress CIDRs - Based on original project's custom_cp_nsg_ingress_cidr
# ingress_cidr = "175.100.46.162/32"

# Port Configuration for Kubernetes API access
ingress_port = 6443 # Kubernetes API server
egress_port  = 443  # HTTPS
protocol     = "6"  # TCP
