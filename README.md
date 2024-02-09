# Solace PubSub+ Software Event Broker Queue Endpoint Terraform Module

Terraform module to configure a "guaranteed messaging endpoint" or an "endpoint template" on the [Solace PubSub+ Event Broker](https://solace.com/products/event-broker/). Note: "queue endpoint" in the title also refers to all these types as a generic name. 

This module supports the configuration of one of the followings:

- a "_queue_" or a "_topic endpoint_": applications that make use of [Guaranteed Messaging](https://docs.solace.com/Messaging/Guaranteed-Msg/Guaranteed-Messages.htm), need [endpoints](https://docs.solace.com/Messaging/Guaranteed-Msg/Endpoints.htm) configured on the event broker to persist messages. A queue may also have a list of [topic subscriptions](https://docs.solace.com/API/API-Developer-Guide/Adding-Topic-Subscriptio.htm).

- a "_queue template_" or a "_topic endpoint template_": [Endpoint templates](https://docs.solace.com/Messaging/Guaranteed-Msg/Endpoint-Templates.htm?Highlight=Endpoint%20templates) may be used for new client created endpoints.

The module also supports exposing a created queue or topic endpoint via JNDI for JMS applications.

Full details are provided in the [Examples](#example).

## Module input variables

### Required

* `msg_vpn_name` - Endpoints and endpoint templates are specific to a Message VPN on the broker
* `endpoint_type` - The type of the endpoint or template to be created. Only one type is allowed at a time.
* `endpoint_name` - The name of the endpoint or template to be created
* `permission` - Queues or topic endpoints must have proper `owner` or `permission` for non-owners configured to enable clients to connect and consume messages. The user shall consider the security implications when choosing a value. For additional details, refer to the [PubSub+ documentation](https://docs.solace.com/Messaging/Guaranteed-Msg/Configuring-Queues.htm#Configuring_Permissions_for_Non-Owner_Clients_..57)


### Optional

Optional module variables are either shared by multiple types, or conditional to the type where incompatible variables will be ignored. For example, the `permission` variable is shared by all endpoint and template types but `queue_name_filter` is specific to the `queue_template` type and ignored for other types. The recommended approach to determine variable name mappings is to look up the endpoint or template resource's documentation for matching attribute names:

| Resource name |
|---------------|
|[solacebroker_msg_vpn_queue](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_queue#optional)|
|[solacebroker_msg_vpn_topic_endpoint](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_topic_endpoint#optional)|
|[solacebroker_msg_vpn_queue_template](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_queue_template#optional)|
|[solacebroker_msg_vpn_topic_endpoint_template](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_topic_endpoint_template#optional)|

Most optional variables' default value is null. If they are not provided then the default for the related resource attribute will be configured on the broker.

-> The module defaults for `ingress_enabled` and `egress_enabled` optional variables are `true`, which differ from the resource attribute defaults.

## Module outputs

Outputs provide references to created resources. Any reference for a resource that has not been created for an endpoint type will be set to `(null)`.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_solacebroker"></a> [solacebroker](#provider\_solacebroker) | ~> 0.9 |

## Resources

The following table shows the resources created for each `endpoint-type` value. "X" denotes a resource always created, "O" is a resource that may be created optionally  

| Name | queue | topic_endpoint | queue_template | topic_endpoint_template |
|------|------|------|------|------|
| solacebroker_msg_vpn_queue | X | | | |
| solacebroker_msg_vpn_jndi_queue | O | | | |
| solacebroker_msg_vpn_queue_subscription | O | | | |
| solacebroker_msg_vpn_topic_endpoint | | X | | |
| solacebroker_msg_vpn_jndi_topic | | O | | |
| solacebroker_msg_vpn_queue_template | | | X | |
| solacebroker_msg_vpn_topic_endpoint_template | | | | X |

## Examples

Refer to the following configuration examples:

- Queue
    - [Exclusive queue](examples/exclusive-queue)
    - [Non-exclusive queue](examples/non-exclusive-queue)
    - [Exclusive queue](examples/partitioned-queue)
    - [Queue with topic subscriptions](examples/queue-with-topic-subscriptions)
    - [Queue with exposed JNDI](examples/queue-with-jndi)
- [Queue template](examples/queue-template)
- [Topic endpoint](examples/topic-endpoint)
    - [Topic endpoint with exposed JNDI](examples/topic-endpoint-with-jndi)
- [Topic endpoint template](examples/topic-endpoint-template)

## Module use recommendations

This module is expected to be used primarily by application teams. It supports provisioning endpoints or templates required by a specific application. It may be forked and adjusted with private defaults.

## Resources

For more information about Solace technology in general please visit these resources:

- Solace [Technical Documentation](https://docs.solace.com/)
- The Solace Developer Portal website at: [solace.dev](//solace.dev/)
- Understanding [Solace technology](//solace.com/products/platform/)
- Ask the [Solace community](//dev.solace.com/community/).
