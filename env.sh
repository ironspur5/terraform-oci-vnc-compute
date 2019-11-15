#Enter Your Tenancy OCID
export TF_VAR_tenancy_ocid=" "

#Enter Your Compartment OCID
export TF_VAR_compartment_ocid=" "

#Enter Your User OCID
export TF_VAR_user_ocid=" "

#Enter Your Fingerprint
export TF_VAR_fingerprint=" "

#Enter Your Region (Example: us-ashburn-1)
export TF_VAR_region=" "

#Enter the Image OCID
export TF_VAR_image_ocid=" "

#Enter Shape for Instance (Example: VM.Standard1.1)
export TF_VAR_instance_shape=" "

#Enter the defined tags your tenancy may require here (optional)
export TF_VAR_defined_tag_uptime=" "
export TF_VAR_defined_tag_team=" "
export TF_VAR_defined_tag_creator=" "
export TF_VAR_defined_tag_closedate=" "

#Enter Path to Your Private API Key PEM file
export TF_VAR_private_key_path="/Path/to/oci_api_key.pem"

#Enter Path to Your Public SSH Key
export TF_VAR_ssh_public_key=$(cat /Path/to/rsa_key.pub)

#Enter Path to Your Private SSH Key
export TF_VAR_ssh_authorized_private_key=$(cat /Path/to/rsa_key)