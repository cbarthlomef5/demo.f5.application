# aws.cfe.public.to.private.demo

Steps to perform demo converting Cloud Failover Extention (CFE) deployed via CloudFormation Template (CFT) from Public facing to Private facing

# Resources
CFE: https://clouddocs.f5.com/products/extensions/f5-cloud-failover/latest/userguide/overview.html
CFT: https://github.com/F5Networks/f5-aws-cloudformation-v2/tree/main/examples/failover 
UDF Template: https://udf.f5.com/b/6c47bd30-b7c0-47ce-a8c9-db8d3dfa0f73#documentation


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
4. Run Terraform Plan command to validate UDF environment is fully spun up and credentials are in appropriate location
5. Run Terraform Apply to deploy AWS environment and CloudFormation Template