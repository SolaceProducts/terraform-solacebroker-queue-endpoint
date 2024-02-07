# Non-exclusive queue example

Configuration in [this directory] creates a non-exclusive queue on the PubSub+ event broker leveraging the Queue Endpoint Terraform module.

## Mandatory inputs

* `msg_vpn_name` - set to `default` in the example
* `endpoint_type` - set to `queue`
* `endpoint_name`

While an optional input, `access_type` is set to `non-exclusive` to configure a non-exclusive queue.

## Optional Inputs

Optional module input variables have the same name and defaults if omitted, as the attributes of the underlying provider resource. Refer to the [documentation of `solacebroker_msg_vpn_queue`](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_queue#optional).


