variable "duration" {
  description = "Assessment duration in seconds"
  type        = string
  default     = "PT1H"  # 1 hour
}

variable "assessment_target_name" {
  description = "Name of the Inspector target"
  type        = string
}

variable "assessment_template_name" {
  description = "Name of the Inspector assessment"
  type        = string  
}