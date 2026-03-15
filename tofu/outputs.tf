output "app_name" {
  description = "The Fly.io app name"
  value       = fly_app.cucumbrr.name
}

output "app_hostname" {
  description = "Default fly.dev hostname"
  value       = "${fly_app.cucumbrr.name}.fly.dev"
}

output "ipv4_address" {
  description = "Dedicated IPv4 address"
  value       = fly_ip.ipv4.address
}

output "ipv6_address" {
  description = "Dedicated IPv6 address"
  value       = fly_ip.ipv6.address
}

output "volume_id" {
  description = "PocketBase data volume ID"
  value       = fly_volume.data.id
}
