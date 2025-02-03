# ----------------
# Provider: AWS
# ----------------
aws_region = "ap-southeast-2"

# ----------------
# Module: inspector
# ----------------

duration = 60 # For testing purposes, set the duration to 60 seconds
# duration                 = 3600 # 1 hour
assessment_target_name   = "inspector-target-dev-apse2"
assessment_template_name = "inspector-template-dev-apse2"

# ----------------
# Module: ec2 & asg
# ----------------
ami_id        = "ami-00c97da679c04f4a0" #Amazon Linux 2
instance_type = "t2.micro"
environment   = "dev"

# ----------------
# Module: ec2
# ----------------
standalone-ec2_with_tags_name    = "ec2-dev-apse2-standalone-ec2-tags-01"
standalone-ec2_without_tags_name = "ec2-dev-apse2-standalone-ec2-without-tags-01"
standalone_ec2_role_name         = "role-dev-apse2-standalone-ec2-01"

# ----------------
# Module: asg
# ----------------
asg-ec2-name     = "ec2-dev-apse2-asg-ec2-01"
min_size         = 1
max_size         = 3
desired_capacity = 2
subnet_ids       = ["subnet-0701f34b16a7160c0", "subnet-001cd48fb525b1981, subnet-033c427ceeba293e3"]
asg_role_name    = "role-dev-apse2-asg-ec2-01"