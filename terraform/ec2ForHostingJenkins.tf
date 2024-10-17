# Create an EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.25"
  subnets         = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
  vpc_id          = aws_vpc.main_vpc.id

  node_groups = {
    ng1 = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
    ng2 = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }
}
