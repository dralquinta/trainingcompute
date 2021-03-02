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