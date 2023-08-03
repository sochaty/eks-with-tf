# Create AWS EKS Node Group - Public
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_role_arn   = data.aws_iam_role.eks_nodegroup_role.arn
  count = length(var.eks_nodegroup_list)

  node_group_name = var.eks_nodegroup_list[count.index].name
  
  subnet_ids = var.eks_nodegroup_list[count.index].is_private != false ? data.aws_subnets.private-subnets.ids : data.aws_subnets.public-subnets.ids

#   subnet_ids      = var.cluster_subnets
  #version = var.cluster_version #(Optional: Defaults to EKS Cluster Kubernetes version)  
    
  
  ami_type = var.eks_nodegroup_list[count.index].ami_type  
  capacity_type = var.eks_nodegroup_list[count.index].capacity_type
  disk_size = var.eks_nodegroup_list[count.index].disk_size
  instance_types = var.eks_nodegroup_list[count.index].instance_types
  
  
  remote_access {
    ec2_ssh_key = var.eks_nodegroup_list[count.index].remote_access.ec2_ssh_key #"eks-terraform-key"
  }

  scaling_config {
    desired_size = var.eks_nodegroup_list[count.index].scaling.expected
    min_size     = var.eks_nodegroup_list[count.index].scaling.min    
    max_size     = var.eks_nodegroup_list[count.index].scaling.max
  }

  # Desired max percentage of unavailable worker nodes during node group update.
  update_config {
    max_unavailable = var.eks_nodegroup_list[count.index].update_config.max_unavailable    
    #max_unavailable_percentage = 50    # ANY ONE TO USE
  }

  labels = {
    "Name" = var.eks_nodegroup_list[count.index].is_private != false ? "Private-Node" : "Public-Node"
  }

  # launch_template {
  #   id = aws_launch_template.node_public.id
  #   version = aws_launch_template.node_public.latest_version
  # }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#   depends_on = [
#     aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
#   ] 

  tags = {
    Name = var.eks_nodegroup_list[count.index].name
  }
}

# resource "aws_launch_template" "node_public" {
#   image_id               = "AL2_x86_64"
#   instance_type          = "t3.medium"
#   name                   = "public_node_template"
#   update_default_version = true

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name                        = "Public-Node"
#     }
#   }
# } 