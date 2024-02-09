# Exclusive Queue Example

Configuration in this directory creates an [exclusive queue](https://docs.solace.com/Messaging/Guaranteed-Msg/Configuring-Queues.htm#Configuring_Access_Types_..49) on the PubSub+ event broker leveraging the Queue Endpoint Terraform module.

## Module Configuration in the Example

### Mandatory Inputs

* `msg_vpn_name` - set to `default` in the example
* `endpoint_type` - set to `queue`
* `endpoint_name` - set to `testQ` in the example
* `permission` - set to `consume` to enable the receiver app to remove consumed messages from the queue

### Optional Inputs

Optional module input variables have the same name and defaults if omitted, as the attributes of the underlying provider resource. Refer to the [documentation of "solacebroker_msg_vpn_queue"](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_queue#optional).

The `access_type` module input variable defines if a queue is "exclusive" or "non-exclusive". The default is "exclusive", so the variable doesn't need to be strictly specified.

### Output

The module `queue` output refers to the created queue.

## Running the Example

### Access to a PubSub+ broker

If you don't already have access to a broker, refer to the [Developers page](https://www.solace.dev/) for options to get started.

### Adjust Provider Configuration

Adjust the [provider parameters](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs#schema) in `main.tf` according to your broker. The example configuration shows settings for a local broker running in Docker.

### Create the resource

Hint: You can verify configuration changes on the broker, before and after, using the [PubSub+ Broker Manager Web UI](https://docs.solace.com/Admin/Broker-Manager/PubSub-Manager-Overview.htm)

Execute from this folder:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` to clean up created resources when no longer needed.

## Additional Documentation

Refer to the [Configuring Queues](https://docs.solace.com/Messaging/Guaranteed-Msg/Configuring-Queues.htm#Configuring_Queues) section in the PubSub+ documentation.

