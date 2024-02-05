provider solacebroker {
  username       = "admin"
  password       = "admin"
  url            = "http://localhost:8080"
}

module "messaging_endpoint_1" {
  source = "../../internal/gen-template"

  msg_vpn_name = "default"
  endpoint_type = "queue"
  endpoint_name = "testQ2"
  queue_subscription_topics = ["foo/bar1", "foo/bar2", "foo/bar3"]
  max_msg_size = 10
  jndi_queue_name = "jndi/q"
}


module "messaging_endpoint_2" {
  source = "../../internal/gen-template"

  msg_vpn_name = "default"
  endpoint_type = "topic_endpoint"
  endpoint_name = "testT2"
  queue_subscription_topics = ["foo/bar1", "foo/bar3"]
  max_msg_size = 10
  jndi_topic_name = "jndi/t"
}

module "queue_template_1" {
  source = "../../internal/gen-template"

  msg_vpn_name = "default"
  endpoint_type = "queue_template"
  endpoint_name = "qt"
}

module "te_template_1" {
  source = "../../internal/gen-template"

  msg_vpn_name = "default"
  endpoint_type = "topic_endpoint_template"
  endpoint_name = "te"
}

output "queue" {
  value = module.messaging_endpoint_1.queue
}

