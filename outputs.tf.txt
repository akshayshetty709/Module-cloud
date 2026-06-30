output "distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.this.id
}

output "domain_name" {
  description = "The domain name of the distribution"
  value       = aws_cloudfront_distribution.this.domain_name
}

output "hosted_zone_id" {
  description = "The hosted zone ID of the distribution (for Route53 alias)"
  value       = aws_cloudfront_distribution.this.hosted_zone_id
}

output "arn" {
  description = "The ARN of the distribution"
  value       = aws_cloudfront_distribution.this.arn
}
