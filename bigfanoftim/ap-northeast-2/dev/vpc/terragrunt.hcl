include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules/vpc"
}

inputs = {
  vpc = {
    cidr_block                           = "10.0.0.0/16"
    assign_generated_ipv6_cidr_block     = false
    enable_dns_support                   = true
    enable_dns_hostnames                 = true
    enable_network_address_usage_metrics = false
  }
}