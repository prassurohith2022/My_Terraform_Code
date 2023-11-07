## Variables for Eks Cluster Deployment:

aws_region                           = "ap-southeast-1"
environment                          = "uat"
iam_role_eks_master_name             = "iam-role-eks-master"
iam_role_eks_nodegroup_name          = "iam-role-eks-nodegroup"
cluster_name                         = "UBEAPPEKSCLUS02"
cluster_service_ipv4_cidr            = "172.31.0.0/16"
cluster_version                      = "1.27"
cluster_endpoint_private_access      = true
cluster_endpoint_public_access       = false
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
eks_node_group_name                  = "UBEAPPNODEGRP"
#key_name                             = "eks-key"
eks_subnets                          = ["subnet-0bda8bb8d361e6086", "subnet-040ce8676f3423e6c"]
