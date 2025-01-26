resource "aws_instance" "ec2_with_tags" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.this.name

  tags = {
    Name = var.ec2_with_tags_name
    Environment = var.environment
    Role = "standalone"
  }

  user_data = file("${path.module}/user_data.sh")
}

resource "aws_instance" "ec2_without_tags" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.this.name

  tags = {
    Name = var.ec2_without_tags_name    
  }

  user_data = file("${path.module}/user_data.sh")
}

# ------------------------------------------------------------
# IAM Role and Instance Profile for EC2 to connect via SSM
# ------------------------------------------------------------
resource "aws_iam_instance_profile" "this" {
  name = "instance-profile-dev-ec2-01"
  role = aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  name = var.role_name

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

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "inspector" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonInspectorFullAccess" # Allow full access to Amazon Inspector  
}