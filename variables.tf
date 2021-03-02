/* variables.tf 
Author: DALQUINT - denny.alquinta@oracle.com
Purpose: The following script declares all variables used in this backend repository
Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved. 
*/

/********** Tenancy and Provider Variables **********/
variable "region" {
  description = "Target region where artifacts are going to be created"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy"
}

variable "user_ocid" {
  description = "User OCID in tenancy. Currently hardcoded to user denny.alquinta@oracle.com"
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}

variable "ssh_public_is_path" {
  description = "Describes if SSH Public Key is located on file or inside code"
  default     = false
}

variable "ssh_private_is_path" {
  description = "Describes if SSH Private Key is located on file or inside code"
  default     = false
}

variable "ssh_public_key" {
  description = "Defines SSH Public Key to be used in order to remotely connect to compute instance"
  type        = string

}
variable "private_key_path" {
  description = "Private Key Absolute path location where terraform is executed"

}

variable "ssh_private_key" {
  description = "Private key to log into machine"

}

/********** Tenancy and Provider Variables **********/


/********** Compute Variables **********/
variable "num_instances" {
  description = "Amount of instances to create"
  default     = 0
}

variable "label_zs" {
  type        = list(any)
  description = "Auxiliary variable to concatenate with compute number"
  default     = ["0", ""]
}


variable "compute_display_name_base" {
  description = "Defines the compute and hostname Label for created compute"
}

variable "instance_shape" {
  description = "Defines the shape to be used on compute creation"
}

variable "primary_vnic_display_name" {
  description = "Defines the Primary VNIC Display Name"
  default     = "primaryvnic"
}

variable "assign_public_ip_flag" {
  description = "Defines either machine will have or not a Public IP assigned. All Pvt networks this variable must be false"
  default     = false
}

variable "fault_domain_name" {
  description = "Describes the fault domain to be used by machine"
}

variable "instance_image_ocid" {
  description = "Defines the OCID for the OS image to be used on artifact creation. Extract OCID from: https://docs.cloud.oracle.com/iaas/images/ or designated custom image OCID created by packer"
}

variable "private_ip" {
  description = "Describes the private IP required for machine"
  default     = null
}

variable "bkp_policy_boot_volume" {
  description = "Describes the backup policy attached to the boot volume"
  default     = "gold"
}


variable "linux_compute_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}

variable "linux_compute_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "is_compute_private" {
  description = "Determines if compute must be created on private subnet"
  default     = true
}


/********** Compute Variables **********/

/********** Datasource and Subnet Lookup related variables **********/
variable "compute_availability_domain_list" {
  type        = list(any)
  description = "Defines the availability domain where OCI artifact will be created. This is a numeric value greater than 0"
}

variable "public_network_subnet_name" {
  description = "Defines the specific Subnet to be used for this resource"
}

variable "private_network_subnet_name" {
  description = "Defines the specific Subnet to be used for this resource"
}

variable "vcn_display_name" {
  description = "VCN Display name to execute lookup"
}
/********** Datasource related variables **********/