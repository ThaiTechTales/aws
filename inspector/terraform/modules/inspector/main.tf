resource "aws_inspector_resource_group" "this" {
  tags = {
    Environment = "dev"
  }
}

resource "aws_inspector_assessment_target" "this" {
  name                = "ec2-assessment-target"
  resource_group_arn  = aws_inspector_resource_group.this.arn
}

resource "aws_inspector_assessment_template" "this" {
  name               = "ec2-assessment-template"
  target_arn         = aws_inspector_assessment_target.this.arn 
  duration           = var.duration # The duration of the assessment run in seconds

  # Use the rules packages for Common Vulnerabilities and Exposures (CVE) and Center for Internet Security (CIS) benchmarks
  # https://docs.aws.amazon.com/inspector/latest/userguide/inspector_rules-arns.html
  rules_package_arns = [
    "arn:aws:inspector:ap-southeast-2:454640832652:rulespackage/0-D5TGAxiR", # Common Vulnerabilities and Exposures (CVE)
    "arn:aws:inspector:ap-southeast-2:454640832652:rulespackage/0-Vkd2Vxjq"  # Center for Internet Security (CIS) benchmarks
  ]
}