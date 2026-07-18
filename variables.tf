variable "comment" {
  description = "Comment describing the distribution."
  type        = string
  default     = "Managed by Terraform"
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept traffic."
  type        = bool
  default     = true
}

variable "default_root_object" {
  description = "Object returned when a viewer requests the root URL."
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "Price class controlling which edge locations serve the distribution."
  type        = string
  default     = "PriceClass_100"
}

variable "origin_domain_name" {
  description = "DNS domain name of the origin, for example an S3 bucket or custom host."
  type        = string
}

variable "origin_id" {
  description = "Unique identifier for the origin within the distribution."
  type        = string
  default     = "default-origin"
}

variable "viewer_protocol_policy" {
  description = "Protocol policy viewers must use to access content."
  type        = string
  default     = "redirect-to-https"
}

variable "allowed_methods" {
  description = "HTTP methods CloudFront processes and forwards to the origin."
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cached_methods" {
  description = "HTTP methods for which CloudFront caches responses."
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "aliases" {
  description = "Alternate domain names (CNAMEs) served by the distribution."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags applied to the distribution."
  type        = map(string)
  default     = {}
}
