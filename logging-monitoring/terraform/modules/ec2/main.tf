resource "aws_instance" "ec2-dev-apse2-cloudwatch-test-01" {
  count = 2

  ami           = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile = aws_iam_instance_profile.instance-profile-dev-apse2-ec2-01.name
  tags = {
    Name = "ec2-dev-apse2-cloudwatch-test-01"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum install -y amazon-ssm-agent     # Install SSM agent              
              yum update -y # Update the OS

              systemctl start amazon-ssm-agent    # Start SSM agent
              systemctl enable amazon-ssm-agent   # Enable SSM agent to start on boot

              EOF
}

# ------------------------------------------------------------
# IAM Role and Instance Profile for EC2 to connect via SSM
# ------------------------------------------------------------
resource "aws_iam_instance_profile" "instance-profile-dev-apse2-ec2-01" {
  name = "instance-profile-dev-ec2-01"
  role = aws_iam_role.role-dev-apse2-ssm-01.name
}

resource "aws_iam_role" "role-dev-apse2-ssm-01" {
  name = "role-dev-apse2-ssm-01"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "policy-dev-apse2-ssm-core-attachment-01" {
  role       = aws_iam_role.role-dev-apse2-ssm-01.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}