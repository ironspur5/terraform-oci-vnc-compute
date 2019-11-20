# Terraform and OCI: Create VNC Network and Compute Instance

## Software Requirements

To run this you must have installed the Terraform binary (at least 0.9.x) and configured it per instruction.

You must also have installed the Oracle Cloud Infrastructure Terraform provider.

You will also, of course, need access to an Oracle Cloud Infrastructure (OCI) account. If you do not have access, you can request a free trial. 

## Environment Requirements

Please follow all instructions for installing the Terraform and Oracle Cloud Infrastructure Provider executables.

https://github.com/oracle/terraform-provider-oci

## Running

The env.sh file needs to be updated with your tenancy specific information. To find more information on where to find the needed values please visit: https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/apisigningkey.htm

The next step is to run terraform plan from the command line to generate an execution plan. Examine this plan to see what will be built and that there are no errors.

If you are satisfied, you can build the configuration by typing terraform apply. This will build all of the dependencies and construct an environment to match the project.

Note that Terraform generates a terraform.tfstate and terraform.tfstate.backup file which manage the state of your environment. These files should not be hand edited.

If you want to tear down your environment, you can do that by running terraform destroy.

## Commands:
```
$ terraform init

$ . env.sh

$ terraform plan

$ terraform apply

$ terraform destroy
```
