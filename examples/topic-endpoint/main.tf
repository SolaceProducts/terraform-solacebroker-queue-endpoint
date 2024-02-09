provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "topic_endpoint" {
  # update with the module location
  source = "../.."

  msg_vpn_name  = "default"
  endpoint_type = "topic_endpoint"
  endpoint_name = "testTE"

  # permission "consume" enables a messaging client to connect, read and consume messages to/from the topic endpoint
  permission = "consume"

  # access_type "exclusive" is the default topic endpoint access type. While it has been specified here for clarity, it is not strictly required.
  access_type = "exclusive"

  # ingress and egress are enabled by default in the module, no need to enable here
  # ingress_enabled = true
  # egress_enabled = true
}

output "provisioned_topic_endpoint" {
  value       = module.topic_endpoint.topic_endpoint
  description = "The provisioned topic_endpoint resource"
}

