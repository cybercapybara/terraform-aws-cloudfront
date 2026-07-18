output "id" {
  description = "ID of the distribution."
  value       = aws_cloudfront_distribution.this.id
}

output "arn" {
  description = "ARN of the distribution."
  value       = aws_cloudfront_distribution.this.arn
}

output "domain_name" {
  description = "Domain name assigned to the distribution."
  value       = aws_cloudfront_distribution.this.domain_name
}

output "hosted_zone_id" {
  description = "Route 53 hosted zone ID for aliasing to the distribution."
  value       = aws_cloudfront_distribution.this.hosted_zone_id
}

output "status" {
  description = "Current status of the distribution."
  value       = aws_cloudfront_distribution.this.status
}
