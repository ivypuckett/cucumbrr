variable "app_name" {
  description = "The Fly.io application name"
  type        = string
  default     = "cucumbrr"
}

variable "org_slug" {
  description = "The Fly.io organization slug"
  type        = string
  default     = "personal"
}

variable "region" {
  description = "Primary deployment region (e.g. iad, ord, lax)"
  type        = string
  default     = "iad"
}

variable "volume_size_gb" {
  description = "Size of the PocketBase data volume in GB"
  type        = number
  default     = 1
}
