
resource "aws_launch_configuration" "custom_eks_node_launch_config" {
  name_prefix                 = "custom-node-"
  image_id                    = "ami-xxxxxxxxxxxxxxxxx"  # Specify your desired Amazon Linux 2 AMI ID
  instance_type               = "t3.medium"
  security_groups             = [aws_security_group.eks_worker_sg.id]
  key_name                    = "eks-key"  # Specify your SSH key name
  associate_public_ip_address = false  # Set to true for public IPs, false for private
}

resource "aws_security_group" "eks_worker_sg" {
  name_prefix = "eks-worker-sg-"

  # Define your security group rules here.
  # Example rule for allowing traffic from the same security group:
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.eks_vpc.cidr_block]
  }

  vpc_id = aws_vpc.eks_vpc.id
}


resource "aws_autoscaling_group" "custom_eks_node_group" {
  name_prefix                 = "custom-node-group-"
  launch_configuration        = aws_launch_configuration.custom_eks_node_launch_config.name
  vpc_zone_identifier         = aws_subnet.eks_subnets[*].id
  min_size                    = 1
  max_size                    = 2
  desired_capacity            = 1
  health_check_grace_period   = 300
  health_check_type           = "EC2"
  force_delete                = true
  wait_for_capacity_timeout   = "10m"

  tag {
    key                 = "Name"
    value               = "CustomNodeGroup"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_eks_node_group" "custom_eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "custom-node-group"  # Specify a name for your custom node group
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = aws_subnet.eks_subnets[*].id
  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }
  remote_access {
    ec2_ssh_key = "eks-key"
  }
  tags = {
    Name = "CustomNodeGroup"
  }
}