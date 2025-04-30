# Configure the default VPC and subnet if they don't exist
resource "aws_vpc" "default" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "default" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.subnet_cidr
  availability_zone = "${var.region}a" # Assuming availability zone 'a'
  tags = {
    Name = "terraform-subnet"
  }
}

# Create a security group allowing SSH access
resource "aws_security_group" "allow_ssh" {
  name        = var.security_group_name
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # WARNING: This allows SSH from any IP. Restrict as needed.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

# Create the EC2 instance
resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.default.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.instance_name
  }
}
