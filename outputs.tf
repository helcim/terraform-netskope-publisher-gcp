//Publisher Details
output "publisher_name" {
  description = "Name of the Publisher"
  value       = netskope_publishers.Publisher.name
}

output "publisher_token" {
  description = "Publisher Token"
  value       = netskope_publishers.Publisher.token
}

output "publisher_nat_ip" {
  description = "Public IP of the Publisher"
  value       = "${google_compute_instance.NPAPublisher.network_interface.0.access_config.0.nat_ip}"
}

output "publisher_internal_ip" {
  description = "Internal IP of the Publisher"
  value       = "${google_compute_instance.NPAPublisher.network_interface.0.network_ip }"
}

