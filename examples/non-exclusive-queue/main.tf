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
  access_type = "non-exclusive"
  permission = "consume"

  # ingress and egress are enabled by default in the module, no need to enable here
  # ingress_enabled = true
  # egress_enabled = true
}

output "provisioned_queue" {
  value = module.non_exclusive_queue.queue
  description = "The provisioned queue resource"
}

