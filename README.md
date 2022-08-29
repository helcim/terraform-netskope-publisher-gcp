# Netskope Publisher GCP Module
A Terraform Module that creates Netskope Publishers in GCP.

## Usage

### Single Netskope Publisher
```hcl
module "publisher_gcp" {
  source  = "../terraform-netskope-publisher-gcp/"

  publisher_name        = var.publisher_name
  zone                  = var.zone
  network_interface     = var.network_interface
  project               = var.project

}
```

### Multiple Netskope Publishers
```hcl
module "publisher_gcp" {
  source  = "../terraform-netskope-publisher-gcp/"

  for_each = toset(["01", "02", "03"])

  publisher_name = "${var.publisher_name}-${each.key}"
  zone                  = var.zone
  network_interface     = var.network_interface
  project               = var.project

}
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.0 |
| <a name="requirement_netskope"></a> [netskope](#requirement\_netskope) | >= 0.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.0 |
| <a name="provider_netskope"></a> [netskope](#provider\_netskope) | >= 0.2.1 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.NPAPublisher](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [netskope_publishers.Publisher](https://registry.terraform.io/providers/netskopeoss/netskope/latest/docs/resources/publishers) | resource |
| [template_cloudinit_config.config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | GCP Machine Type - e2-medium is the reccomended instance size. | `string` | `"e2-medium"` | no |
| <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface) | GCP Network Interface | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | GCP Project ID | `string` | n/a | yes |
| <a name="input_publisher_name"></a> [publisher\_name](#input\_publisher\_name) | Netskope Publisher Name | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | GCP Zne | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_publisher_name"></a> [publisher\_name](#output\_publisher\_name) | Name of the Publisher |
| <a name="output_publisher_token"></a> [publisher\_token](#output\_publisher\_token) | Public IP of the Publisher |