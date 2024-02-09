provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "topic_endpoint_with_jndi" {
  # update with the module location
  source = "../.."

  msg_vpn_name  = "default"
  endpoint_type = "topic_endpoint"
  endpoint_name = "testJT"

  # permission "consume" enables a messaging client to connect, read and consume messages to/from the topic endpoint
  permission = "consume"

  # if the "jndi_topic_name" input variable is defined then the topic endpoint will be exposed to JNDI under this name
  jndi_topic_name = "/jndi/topic/testJT"

  # ingress and egress are enabled by default in the module, no need to enable here
  # ingress_enabled = true
  # egress_enabled = true
}

output "provisioned_topic_endpoint" {
  value       = module.topic_endpoint_with_jndi.topic_endpoint
  description = "The provisioned topic_endpoint resource"
}

output "provisioned_jndi_topic" {
  value       = module.topic_endpoint_with_jndi.jndi_topic
  description = "The provisioned JNDI topic resource"
}

