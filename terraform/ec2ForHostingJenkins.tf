# Jenkins EC2 Instance
resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.public_sg.name]
  tags = {
    Name = "jenkins-ec2"
  }
}

