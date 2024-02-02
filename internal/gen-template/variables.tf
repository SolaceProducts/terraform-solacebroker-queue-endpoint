# Input variable definitions

variable "msg_vpn_name" {
  description = "Message vpn name"
  type        = string
}

variable "endpoint_type" {
  description = "Queue endpoint type"
  type        = string
  validation {
    condition     = contains(["queue", "topic_endpoint", "queue_template", "topic_endpoint_template"], var.endpoint_type)
    error_message = "The endpoint_type must be one of 'queue', 'topic_endpoint', 'queue_template' or 'topic_endpoint_template'."
  }
}

variable "endpoint_name" {
  description = "The name of the endpoint or template"
  type        = string
}

variable "queue_subscription_topics" {
  description = "List of queue subscription topics. Only valid if endpoint ype is 'queue'."
  type        = list
  default     = []
}

variable "jndi_queue_name" {
  description = "Name of the JNDI queue if provided"
  type        = string
  default     = ""
}

variable "jndi_topic_name" {
  description = "Name of the JNDI topic if provided"
  type        = string
  default     = ""
}

variable "max_msg_size" {
  description = "Max message size"
  type        = number
  default     = null
}
