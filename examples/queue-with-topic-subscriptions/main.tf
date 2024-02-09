provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080"
}

module "queue_with_topic_subscriptions" {
  # update with the module location
  source = "../.."

  msg_vpn_name  = "default"
  endpoint_type = "queue"
  endpoint_name = "testQS"

  # permission "consume" enables messaging a messaging client to connect, read and consume messages to/from the queue
  permission = "consume"

  # this will add the listed subscriptions to the queue
  queue_subscription_topics = ["foo/bar", "baz>"]
}

output "provisioned_queue" {
  value       = module.queue_with_topic_subscriptions.queue
  description = "The provisioned queue resource"
}

output "provisioned_queue_subscriptions" {
  value       = module.queue_with_topic_subscriptions.queue_subscriptions
  description = "The provisioned queue subscription resources"
}


