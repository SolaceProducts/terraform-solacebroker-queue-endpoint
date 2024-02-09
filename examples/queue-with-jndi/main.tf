provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "queue_with_jndi" {
  # update with the module location
  source = "../.."

  msg_vpn_name  = "default"
  endpoint_type = "queue"
  endpoint_name = "testJQ"

  # permission "consume" enables messaging a messaging client to connect, read and consume messages to/from the queue
  permission = "consume"

  # if the "jndi_queue_name" input variable is defined then the queue will be exposed to JNDI under this name
  jndi_queue_name = "/jndi/testJQ"

  # ingress and egress are enabled by default in the module, no need to enable here
  # ingress_enabled = true
  # egress_enabled = true
}

output "provisioned_queue" {
  value       = module.queue_with_jndi.queue
  description = "The provisioned queue resource"
}

output "provisioned_jndi_queue" {
  value       = module.queue_with_jndi.jndi_queue
  description = "The provisioned JNDI queue resource"
}

