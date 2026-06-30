variable "comment" {
  description = "Comment for the distribution (shows in console)"
  type        = string
  default     = ""
}

variable "aliases" {
  description = "Alternate domain names (CNAMEs) for the distribution"
  type        = list(string)
  default     = []
}

variable "certificate_arn" {
  description = "ACM certificate ARN (must be in us-east-1 for CloudFront). Leave null to use the default CloudFront certificate."
  type        = string
  default     = null
}

variable "default_root_object" {
  description = "Default root object (e.g., index.html)"
  type        = string
  default     = "index.html"
}

variable "enabled" {
  description = "Whether the distribution is enabled"
  type        = bool
  default     = true
}

variable "price_class" {
  description = "Price class for the distribution"
  type        = string
  default     = "PriceClass_100" # US, Canada, Europe only

  validation {
    condition     = contains(["PriceClass_100", "PriceClass_200", "PriceClass_All"], var.price_class)
    error_message = "price_class must be PriceClass_100, PriceClass_200, or PriceClass_All"
  }
}

# S3 origin configuration
variable "s3_origin" {
  description = "S3 bucket origin configuration"
  type = object({
    bucket_id          = string
    bucket_arn         = string
    bucket_domain_name = string
    origin_path        = optional(string, "")
  })
}

# Default cache behavior
variable "default_cache_behavior" {
  description = "Default cache behavior settings"
  type = object({
    target_origin_id       = string
    viewer_protocol_policy = optional(string, "redirect-to-https")
    allowed_methods        = optional(list(string), ["GET", "HEAD"])
    cached_methods         = optional(list(string), ["GET", "HEAD"])
    compress                 = optional(bool, true)
    default_ttl              = optional(number, 86400)
    max_ttl                   = optional(number, 31536000)
    min_ttl                   = optional(number, 0)
    cache_policy_id           = optional(string, null)
    origin_request_policy_id  = optional(string, null)
  })
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
