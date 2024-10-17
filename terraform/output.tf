output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "public_ec2_public_ip" {
  value = aws_instance.public_ec2.public_ip
}

output "private_ec2_private_ip" {
  value = aws_instance.private_ec2.private_ip
}

output "jenkins_ec2_public_ip" {
  value = aws_instance.jenkins_ec2.public_ip
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}
