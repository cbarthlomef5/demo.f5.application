# aws.cfe.public.to.private.demo

Steps to perform demo converting Cloud Failover Extention (CFE) deployed via CloudFormation Template (CFT) from Public facing to Private facing

# Resources
* CFE: https://clouddocs.f5.com/products/extensions/f5-cloud-failover/latest/userguide/overview.html
* CFT: https://github.com/F5Networks/f5-aws-cloudformation-v2/tree/main/examples/failover 
* UDF Template: https://udf.f5.com/b/6c47bd30-b7c0-47ce-a8c9-db8d3dfa0f73#documentation


# Demo Requirements
1. Must have the following applications installed to utilize automation
    * Python
    * Terraform
2. AWS Enviornment for Demo



# Demo Steps
1. Start UDF instance from UDF template
2. Connect to UDF AWS Environment and subscribe to F5 product used in demo
    1. Use credentials provided from UDF deployment
        * Credentials found on the "Cloud Accounts" tab of UDF deployment
    2. Within AWS, navigate to AWS Marketplace
    3. Locate "Discover Products" within Marketplace page
    4. Search for and subscribe to "F5 BIG-IP BEST with IPI and Threat Campaigns (PAYG, 25Mbps)"
3. Copy files from "aws" folder to "~/.aws" folder and update with correct API Key and Secret
    * Folder should be located in current user's home directory
    * API Key and Secret can be found on the "Cloud Accounts" tab of the UDF deployment
4. Generate new private key for SSH connections into AWS resources
    * <b>Strongly recomended to use a key not used for other purposes! Key will be copied to Bastion host for Demo purposes! Use ssh-keygen or Putty to create new keypair</b>
    * Save SSH key in Home directory as "~/.ssh/demo_id_rsa.pub"
    * Can update variables.tf file to point to SSH key if stored in different location or named differently
5. Run Terraform Plan command to validate UDF environment is fully spun up and credentials are in appropriate location
6. Run Terraform Apply to deploy AWS environment and CloudFormation Template
    1. Deployment creates new AWS environment, BigIPs, and bastion host for connections