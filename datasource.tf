/* datasources.tf 
Author: DALQUINT - denny.alquinta@oracle.com
Purpose: The following script defines the lookup logic used in code to obtain pre-created resources in tenancy.
Copyright (c) 2017, 2020, Oracle and/or its affiliates. All rights reserved. 
*/

/********** Compartment and CF Accessors **********/
data "oci_identity_compartments" "COMPARTMENTS" {
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = true
  filter {
    name   = "name"
    values = [var.linux_compute_instance_compartment_name]
  }
}

data "oci_identity_compartments" "NWCOMPARTMENTS" {
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = true
  filter {
    name   = "name"
    values = [var.linux_compute_network_compartment_name]
  }
}

data "oci_core_vcns" "VCN" {
  compartment_id = local.nw_compartment_id
  filter {
    name   = "display_name"
    values = [var.vcn_display_name]
  }
}


/********** Subnet Accessors **********/

data "oci_core_subnets" "PUBSUBNET01" {
  compartment_id = local.nw_compartment_id
  vcn_id         = local.vcn_id
  filter {
    name   = "display_name"
    values = [var.public_network_subnet_name]
  }
}

data "oci_core_subnets" "PVTSUBNET01" {
  compartment_id = local.nw_compartment_id
  vcn_id         = local.vcn_id
  filter {
    name   = "display_name"
    values = [var.private_network_subnet_name]
  }
}

/********** Backup Policy Accessors **********/

data "oci_core_volume_backup_policies" "BACKUPPOLICYBOOTVOL" {
  filter {
    name = "display_name"

    values = [var.bkp_policy_boot_volume]
  }
}



locals {

  /********** Subnet OCID local accessors **********/
  Net-Pub_ocid = length(data.oci_core_subnets.PUBSUBNET01.subnets) > 0 ? data.oci_core_subnets.PUBSUBNET01.subnets[0].id : null
  Net-Pvt_ocid = length(data.oci_core_subnets.PVTSUBNET01.subnets) > 0 ? data.oci_core_subnets.PVTSUBNET01.subnets[0].id : null

  /********** Compartment OCID Local Accessor **********/
  compartment_id    = lookup(data.oci_identity_compartments.COMPARTMENTS.compartments[0], "id")
  nw_compartment_id = lookup(data.oci_identity_compartments.NWCOMPARTMENTS.compartments[0], "id")
  /********** VCN OCID Local Accessor **********/
  vcn_id = lookup(data.oci_core_vcns.VCN.virtual_networks[0], "id")
  # Backup policies retrieval by tfvars volume-specifc values 
  backup_policy_bootvolume_disk_id = data.oci_core_volume_backup_policies.BACKUPPOLICYBOOTVOL.volume_backup_policies[0].id


}