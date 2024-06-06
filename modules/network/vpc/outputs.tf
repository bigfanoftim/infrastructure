# ---------------------------------------------------------------------------------------------------------------------
# outputs
# ---------------------------------------------------------------------------------------------------------------------
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = {for key, subnet in aws_subnet.public : key => subnet.id}
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}
