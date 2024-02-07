provider solacebroker {
  username       = "admin"
  password       = "admin"
  url            = "http://localhost:8080"
}

module "non_exclusive_queue" {
  source = "../.."

  msg_vpn_name = "default"
  endpoint_type = "queue"
  endpoint_name = "testQ"
  access_type = "non-exclusive"

  # ingress and egress are enabled by default in the module
  # ingress_enabled = true
  # egress_enabled = true

  # other optional module variables example
  permission = "consume"
}

output "provisioned_queue" {
  value = module.non_exclusive_queue.queue
}

