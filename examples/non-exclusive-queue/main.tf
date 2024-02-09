provider solacebroker {
  username       = "admin"
  password       = "admin"
  url            = "http://localhost:8080"
}

module "non_exclusive_queue" {
  # update with the module location
  source = "../.."

  msg_vpn_name = "default"
  endpoint_type = "queue"
  endpoint_name = "testQ"

  # permission "consume" enables messaging a messaging client to connect, read and consume messages to/from the queue
  permission = "consume"

  # access_type "non-exclusive" is the default queue access type, no need to specify here
  # access_type = "non-exclusive"

  # ingress and egress are enabled by default in the module, no need to enable here
  # ingress_enabled = true
  # egress_enabled = true
}

output "provisioned_queue" {
  value = module.non_exclusive_queue.queue
  description = "The provisioned queue resource"
}

