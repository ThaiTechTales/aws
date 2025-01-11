resource "aws_vpc" "vpc-dev-apse2-main-01" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc-dev-apse2-main-01"
  }
}

resource "aws_subnet" "subnet-dev-apse2-ec2-01" {
  count = 2         # Create two public subnets
  vpc_id            = aws_vpc.vpc-dev-apse2-main-01.id
  cidr_block        = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "subnet-dev-apse2-ec2-0${count.index + 1}"
  }
}

resource "aws_security_group" "security-group-dev-apse2-01" {
  name        = "security-group-dev-apse2-01"
  description = "Security group for the VPC"
  vpc_id      = aws_vpc.vpc-dev-apse2-main-01.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ----------------------------------------------------------------------------------------
# Internet Gateway and Route Table are required to access the public internet. 
# The SSM Agent on the EC2 instance needs to communicate with the 
# AWS Systems Manager service endpoints to register the instance, send status updates, 
# and receive commands. These endpoints are hosted on the public internet.
# ----------------------------------------------------------------------------------------


resource "aws_internet_gateway" "igw-dev-apse2-01" {
  vpc_id = aws_vpc.vpc-dev-apse2-main-01.id
}

# Route Table allows the EC2 instances in the public subnet to access the public internet.
resource "aws_route_table" "rt-dev-apse2-01" {
  vpc_id = aws_vpc.vpc-dev-apse2-main-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-dev-apse2-01.id
  }
}

# Associate the Route Table with the Public Subnet to allow the EC2 instances to access the public internet.
resource "aws_route_table_association" "public_rt_assoc" {
  count          = 2
  subnet_id      = aws_subnet.subnet-dev-apse2-ec2-01[count.index].id
  route_table_id = aws_route_table.rt-dev-apse2-01.id
}