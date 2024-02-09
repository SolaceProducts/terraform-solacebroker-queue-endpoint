provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "queue_template" {
  # update with the module location
  source = "../.."

  msg_vpn_name  = "default"
  endpoint_type = "queue_template"
  endpoint_name = "testQT"

  # permission "consume" enables a messaging client to connect, read and consume messages to/from the queue
  # that has been created from the template
  permission = "consume"

  # example optional config for the queue template
  respect_ttl_enabled = true
}

output "provisioned_queue_template" {
  value       = module.queue_template.queue_template
  description = "The provisioned queue template resource"
}

