## output value of ec2 instance profile:

output "ec2_iam_profile" {
  description = "ec2_iam_profile"
  value = aws_iam_instance_profile.ec2_iam_profile.id
}

