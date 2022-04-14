# Step 10 - Add output variables
output "private_ip" {
  value = aws_instance.prod_VM[*].private_ip
}
