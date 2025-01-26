output "assessment_template_ids" {  
  value = [for template in aws_inspector_assessment_template.this : template.id]
}