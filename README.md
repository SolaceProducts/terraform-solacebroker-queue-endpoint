# Solace PubSub+ Software Event Broker Queue Endpoint Terraform Module

Terraform module to configure a "guaranteed messaging endpoint" or an "endpoint template" on the PubSub+ event broker. Note: "queue endpoint" in the title also refers to all these types as a generic name. 

This module supports the configuration of one of the followings:

- a "queue" or a "topic endpoint": applications that make use of [Guaranteed Messaging](https://docs.solace.com/Messaging/Guaranteed-Msg/Guaranteed-Messages.htm), need [endpoints](https://docs.solace.com/Messaging/Guaranteed-Msg/Endpoints.htm) configured on the event broker to persist messages. A queue may also have a list of [topic subscriptions](https://docs.solace.com/API/API-Developer-Guide/Adding-Topic-Subscriptio.htm).

- a "queue template" or a "topic endpoint template": [Endpoint templates](https://docs.solace.com/Messaging/Guaranteed-Msg/Endpoint-Templates.htm?Highlight=Endpoint%20templates) may be used for new client created endpoints.

The module also supports exposing a created queue or topic endpoint via JNDI for JMS applications.

## Module variables

Endpoints and endpoint templates are specific to a Message VPN on the broker, therefore the Message VPN name is a mandatory module input variable.

Another mandatory input variable is the type of the endpoint or template to be created. Only one type can be created at a time.

Optional module variables are either shared by multiple types, or conditional to the type where incompatible variables will be ignored. For example, the `permission` variable is shared by all endpoint and template types but `queue_name_filter` is specific to the `queue_template` type and ignored for other types. The recommended approach to determine variable name mappings is to look up the endpoint or template resource's documentation for matching attribute names:

| Resource name |
|---------------|
|[`queue`](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_queue#optional)|
|[`topic_endpoint`](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_topic_endpoint#optional)|
|[`queue_template`](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_queue_template#optional)|
|[`topic_endpoint_template`](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_topic_endpoint_template#optional)|

Most optional variables' default value is null. If they are not provided then the default for the related resource attribute will be configured on the broker.

## Examples

Refer to the following configuration examples:

- Queue
    - Exclusive queue
    - Non-exclusive queue
    - Partitioned queue
    - Queue with topic subscriptions
    - Queue with exposed JNDI
- Queue template
- Topic endpoint
    - Topic endpoint with exposed JNDI
- Topic endpoint template

## Module use recommendations

## Resources

For more information about Solace technology in general please visit these resources:

- The Solace Developer Portal website at: [solace.dev](//solace.dev/)
- Understanding [Solace technology](//solace.com/products/platform/)
- Ask the [Solace community](//dev.solace.com/community/).
