
resource "aws_launch_configuration" "custom_eks_node_launch_config" {
  name_prefix                 = "custom-node-template"
  image_id                    = "ami-0840becec4971bb87" # Specify your desired Amazon Linux 2 AMI ID
  instance_type               = "t3.medium"
  #security_groups             = [aws_security_group.eks_worker_sg.id]
  key_name                    = "eks-key" # Specify your SSH key name
  associate_public_ip_address = false     # Set to true for public IPs, false for private
}


resource "aws_autoscaling_group" "custom_eks_node_group" {
  name_prefix               = "ASG-SM"
  launch_configuration      = aws_launch_configuration.custom_eks_node_launch_config.name
  vpc_zone_identifier       = var.eks_subnets
  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true
  wait_for_capacity_timeout = "10m"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_eks_node_group" "custom_eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "ngp"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = var.eks_subnets
  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }
  remote_access {
    ec2_ssh_key = "eks-key"
  }
}