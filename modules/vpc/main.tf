# --------------------------------------------------------------------------------------------------------------------
# Create a VPC
# --------------------------------------------------------------------------------------------------------------------
resource "aws_vpc" "main" {
  cidr_block = var.vpc.cidr_block

  assign_generated_ipv6_cidr_block     = var.vpc.assign_generated_ipv6_cidr_block
  enable_dns_support                   = var.vpc.enable_dns_support
  enable_dns_hostnames                 = var.vpc.enable_dns_hostnames
  enable_network_address_usage_metrics = var.vpc.enable_network_address_usage_metrics
}

# --------------------------------------------------------------------------------------------------------------------
# Variables
# --------------------------------------------------------------------------------------------------------------------
variable "vpc" {
  type = object({
    cidr_block                           = string
    assign_generated_ipv6_cidr_block     = bool
    enable_dns_support                   = bool
    enable_dns_hostnames                 = bool
    enable_network_address_usage_metrics = bool
  })
}

# --------------------------------------------------------------------------------------------------------------------
# Outputs
# --------------------------------------------------------------------------------------------------------------------
output "id" {
  value = aws_vpc.main.id
}
