# print the aws ec2 public ipv4 address
output "public_ipv4_address" {
  value = aws_instance.ec2-instance-using-terraform.public_ip  
}