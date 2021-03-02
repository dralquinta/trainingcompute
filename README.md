# Module: suracompute

The following backend module provisions a set of compute instances depending on a numbered set provided by variables

## Sample tfvars file

```shell
######################################## COMMON VARIABLES ######################################
region                      = "us-ashburn-1"
tenancy_ocid                = "ocid1.tenancy.oc1..aaaaaaaaabc4esylkbw3jkbquuluuq4iftuuwnfc2yg2fguo4s7j43exv6pq"
user_ocid                   = "ocid1.user.oc1..aaaaaaaazwzvytqwy23ojocvnmaqqn4u2hf3zylpefj5ur3cqmus5cmiso6q"
fingerprint                 = "81:0e:bb:e1:75:b4:b7:2c:04:c2:97:e9:a0:aa:4d:36"
public_network_subnet_name  = "Subnet_Pub"
private_network_subnet_name = "Subnet_Pvt"
private_key_path            = "/home/opc/.ssh/OCI_KEYS/API/auto_api_key.pem"
######################################## COMMON VARIABLES ######################################


######################################## ARTIFACT SPECIFIC VARIABLES ######################################
ssh_public_key                          = "/home/opc/.ssh/OCI_KEYS/SSH/auto_ssh_id_rsa.pub"
ssh_private_key                         = "/home/opc/.ssh/OCI_KEYS/SSH/auto_ssh_id_rsa"
ssh_public_is_path                      = true
ssh_private_is_path                     = true
compute_availability_domain_list        = ["vzAG:US-ASHBURN-AD-1", "vzAG:US-ASHBURN-AD-2", "vzAG:US-ASHBURN-AD-3"]
fault_domain_name                       = ""
bkp_policy_boot_volume                  = "gold"
linux_compute_instance_compartment_name = "OCI-LAB-04"
linux_compute_network_compartment_name  = "OCI-LAB-04"
vcn_display_name                        = "vcn_oci_iac"
num_instances                           = 2
compute_display_name_base               = "unitarycompute"
instance_image_ocid                     = "ocid1.image.oc1.iad.aaaaaaaaqdc7jslbtue7abhwvxaq3ihvazfvihhs2rwk2mvciv36v7ux5sda" #Image: Oracle-Linux-7.9-2021.01.12-0
instance_shape                          = "VM.Standard2.1"
is_compute_private                      = true
```


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| oci | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assign\_public\_ip\_flag | Defines either machine will have or not a Public IP assigned. All Pvt networks this variable must be false | `bool` | `false` | no |
| bkp\_policy\_boot\_volume | Describes the backup policy attached to the boot volume | `string` | `"gold"` | no |
| compute\_availability\_domain\_list | Defines the availability domain where OCI artifact will be created. This is a numeric value greater than 0 | `list(any)` | n/a | yes |
| compute\_display\_name\_base | Defines the compute and hostname Label for created compute | `any` | n/a | yes |
| fault\_domain\_name | Describes the fault domain to be used by machine | `any` | n/a | yes |
| fingerprint | API Key Fingerprint for user\_ocid derived from public API Key imported in OCI User config | `string` | `"d0:0c:00:7e:a1:05:02:8c:2b:d7:8e:cc:cf:4d:44:e1"` | no |
| instance\_image\_ocid | Defines the OCID for the OS image to be used on artifact creation. Extract OCID from: https://docs.cloud.oracle.com/iaas/images/ or designated custom image OCID created by packer | `any` | n/a | yes |
| instance\_shape | Defines the shape to be used on compute creation | `any` | n/a | yes |
| is\_compute\_private | Determines if compute must be created on private subnet | `bool` | `true` | no |
| label\_zs | n/a | `list(any)` | <pre>[<br>  "0",<br>  ""<br>]</pre> | no |
| linux\_compute\_instance\_compartment\_name | Defines the compartment name where the infrastructure will be created | `any` | n/a | yes |
| linux\_compute\_network\_compartment\_name | Defines the compartment where the Network is currently located | `any` | n/a | yes |
| num\_instances | Amount of instances to create | `number` | `0` | no |
| primary\_vnic\_display\_name | Defines the Primary VNIC Display Name | `string` | `"primaryvnic"` | no |
| private\_ip | Describes the private IP required for machine | `any` | `null` | no |
| private\_key\_path | Private Key Absolute path location where terraform is executed | `any` | n/a | yes |
| private\_network\_subnet\_name | Defines the specific Subnet to be used for this resource | `any` | n/a | yes |
| public\_network\_subnet\_name | Defines the specific Subnet to be used for this resource | `any` | n/a | yes |
| region | Target region where artifacts are going to be created | `any` | n/a | yes |
| ssh\_private\_is\_path | Describes if SSH Private Key is located on file or inside code | `bool` | `false` | no |
| ssh\_private\_key | Private key to log into machine | `any` | n/a | yes |
| ssh\_public\_is\_path | Describes if SSH Public Key is located on file or inside code | `bool` | `false` | no |
| ssh\_public\_key | Defines SSH Public Key to be used in order to remotely connect to compute instance | `string` | n/a | no |
| tenancy\_ocid | OCID of tenancy | `string` | n/a | no |
| user\_ocid | User OCID in tenancy. | `string` | n/a | no |
| vcn\_display\_name | VCN Display name to execute lookup | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance | Compute Generated |
| instance\_private\_ip | Compute Private IP |
| server\_display\_name | Compute Display Name |

------
The following code is protected using Oracle Technology Network License Agreement. For more details, please refer to the project's OEM [LICENSE](LICENSE)  file.



**Copyright (c) 2021, Oracle, Oracle Advanced Customer Services and/or its affiliates. All rights reserved.**


