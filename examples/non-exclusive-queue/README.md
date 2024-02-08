# Non-exclusive Queue Example

Configuration in this directory creates a [non-exclusive queue](https://docs.solace.com/Get-Started/message-exchange-patterns.htm#Point-to) on the PubSub+ event broker leveraging the Queue Endpoint Terraform module.

## Module Use in the Example

### Mandatory Inputs

* `msg_vpn_name` - set to `default` in the example
* `endpoint_type` - set to `queue`
* `endpoint_name`

While an optional input, `access_type` is set to `non-exclusive` to configure a non-exclusive queue.

### Optional Inputs

Optional module input variables have the same name and defaults if omitted, as the attributes of the underlying provider resource. Refer to the [documentation of `solacebroker_msg_vpn_queue`](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_queue#optional).

### Output

The module `queue` output refers to the created queue.

## Running the Example

### Access to a PubSub+ broker

If you don't already have access to a broker, refer to the [Developers page](https://www.solace.dev/) to get started.

### PubSub+ Broker Manager

You can verify configuration changes using the [PubSub+ Broker Manager Web UI](https://docs.solace.com/Admin/Broker-Manager/PubSub-Manager-Overview.htm)

### Adjust Provider Configuration

Adjust the [provider parameters](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs#schema) in `main.tf` according to your broker. The example configuration shows settings for a local broker running in Docker.

### Create the resource

Execute from this folder:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` to clean up created resources.

## Additional Documentation

Refer to the [Configuring Queues](https://docs.solace.com/Messaging/Guaranteed-Msg/Configuring-Queues.htm#Configuring_Queues) section in the Solace documentation.

