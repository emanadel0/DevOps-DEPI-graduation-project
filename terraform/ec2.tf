# Create Public EC2 Instance
resource "aws_instance" "public_ec2" {
  ami           = "ami-0866a3c8686eaeeba" # Ubuntu AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.public_sg.name]
  tags = {
    Name = "public-ec2"
  }
}
# Create Private EC2 Instance
resource "aws_instance" "private_ec2" {
  ami           = "ami-0866a3c8686eaeeba" # Ubuntu AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.private_sg.name]
  tags = {
    Name = "private-ec2"
  }
}
