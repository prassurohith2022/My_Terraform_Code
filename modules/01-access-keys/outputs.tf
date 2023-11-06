# output value of key pair:
/*
output "aws_key_name" {
  description = "key pairs for ec2"
  value = aws_key_pair.key.id
}
*/

# Define outputs for all key pairs

output "key_pair_ids" {
  description = "key pairs for ec2"
  value = aws_key_pair.key[*].id
}