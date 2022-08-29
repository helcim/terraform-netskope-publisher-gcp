//Publisher Details
output "publisher_name" {
  description = "Name of the Publisher"
  value       = netskope_publishers.Publisher.name
}

output "publisher_token" {
  description = "Public IP of the Publisher"
  value       = netskope_publishers.Publisher.token
}