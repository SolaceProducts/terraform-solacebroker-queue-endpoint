provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "partitioned_queue" {
  # update with the module location
  source = "../.."

  msg_vpn_name  = "default"
  endpoint_type = "queue"
  endpoint_name = "testPQ"

  # permission "consume" enables a messaging client to connect, read and consume messages to/from the queue
  permission = "consume"

  # access_type "exclusive" is the default queue access type. This variable needs to be specified here to configure a non-exclusive queue
  access_type = "non-exclusive"

  # example settings
  partition_count                      = 4
  partition_rebalance_delay            = 2
  partition_rebalance_max_handoff_time = 1

  # ingress and egress are enabled by default in the module, no need to enable here
  # ingress_enabled = true
  # egress_enabled = true
}

output "provisioned_queue" {
  value       = module.partitioned_queue.queue
  description = "The provisioned queue resource"
}

