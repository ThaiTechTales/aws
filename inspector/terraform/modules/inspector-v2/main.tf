locals {
  roles = ["standalone", "autoscaling"]
}

resource "aws_inspector_resource_group" "this" {
  for_each = toset(local.roles)
  tags = {
    Role = each.key
  }
}

resource "aws_inspector_assessment_target" "this" {
  for_each = aws_inspector_resource_group.this  
  name = "${var.assessment_target_name}-${each.key}-01"
  resource_group_arn = each.value.arn
}

resource "aws_inspector_assessment_template" "this" {
  for_each = aws_inspector_assessment_target.this
  name = "${var.assessment_template_name}-${each.key}-01"

  target_arn = each.value.arn
  duration   = var.duration # The duration of the assessment run in seconds

  # Use the rules packages for Common Vulnerabilities and Exposures (CVE) and Center for Internet Security (CIS) benchmarks
  # https://docs.aws.amazon.com/inspector/latest/userguide/inspector_rules-arns.html
  rules_package_arns = [
    "arn:aws:inspector:ap-southeast-2:454640832652:rulespackage/0-D5TGAxiR", # Common Vulnerabilities and Exposures (CVE)
    "arn:aws:inspector:ap-southeast-2:454640832652:rulespackage/0-Vkd2Vxjq"  # Center for Internet Security (CIS) benchmarks
  ]
}