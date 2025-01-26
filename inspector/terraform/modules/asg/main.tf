resource "aws_launch_template" "this" {
  name_prefix   = var.name
  image_id      = var.ami_id
  instance_type = var.instance_type
  
  # Role for ASG EC2 to connect via SSM
  iam_instance_profile {
    name = aws_iam_instance_profile.this.name
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.name
      Environment = var.environment
    }
  }

  # base64encode: Encode the user data to base64
  user_data = base64encode(file("${path.module}/../ec2/user_data.sh"))
}

resource "aws_autoscaling_group" "this" {
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest" # This will always use the latest version of the launch template
  }
  
  vpc_zone_identifier = var.subnet_ids  # The subnets in which the instances will be launched

  desired_capacity = var.desired_capacity
  min_size = var.min_size
  max_size = var.max_size

  tag {
    key                 = "Environment"
    value               = var.environment
      propagate_at_launch = true  # Tags will be applied to instances at launch
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true  # Tags will be applied to instances at launch
  }

  tag {
    key                 = "Role"
    value               = "autoscaling"
    propagate_at_launch = true  # Tags will be applied to instances at launch
  }
}

# ------------------------------------------------------------
# IAM Role and Instance Profile for ASG EC2 to connect via SSM
# ------------------------------------------------------------
resource "aws_iam_instance_profile" "this" {
  name = "instance-profile-dev-asg-01"
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