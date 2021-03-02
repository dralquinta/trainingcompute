/* compute.tf 
Author: DALQUINT - denny.alquinta@oracle.com
Purpose: The following script defines the providers used in this repository
Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved. 
*/

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}