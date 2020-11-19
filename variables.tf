variable prefix {
  description = "Prefix for resources created by this module"
  type        = string
  //default     = "tf-aws-bigip"
}

variable f5_username {
  description = "The admin username of the F5 Bigip that will be deployed"
  default     = "bigipuser"
}

variable f5_ami_search_name {
  description = "BIG-IP AMI name to search for"
  type        = string
  default     = "F5 Networks BIGIP-14.* PAYG - Best 200Mbps*"
  //default = "F5 BIGIP-14.1.2.6* PAYG - Best 200Mbps*"
}

variable f5_instance_count {
  description = "Number of BIG-IPs to deploy"
  type        = number
  default     = 1
}

variable ec2_instance_type {
  description = "AWS EC2 instance type"
  type        = string
  default     = "m5.xlarge"
}

variable ec2_key_name {
  description = "AWS EC2 Key name for SSH access"
  type        = string
  //default     = "tf-demo-key"
}

variable mgmt_eip {
  description = "Enable an Elastic IP address on the management interface"
  type        = bool
  default     = true
}

variable aws_secretmanager_auth {
  description = "Whether to use key vault to pass authentication"
  type        = bool
  default     = false
}

variable aws_secretmanager_secret_id {
  description = "AWS Secret Manager Secret ID that stores the BIG-IP password"
  type        = string
  default     = null
}

variable mgmt_subnet_ids {
  description = "The subnet id of the virtual network where the virtual machines will reside."
  type = list(object({
    subnet_id = string
    public_ip = bool
  }))
}

variable external_subnet_ids {
  description = "The subnet id of the virtual network where the virtual machines will reside."
  type = list(object({
    subnet_id = string
    public_ip = bool
  }))
  default = [{ "subnet_id" = null, "public_ip" = null }]
}

variable internal_subnet_ids {
  description = "The subnet id of the virtual network where the virtual machines will reside."
  type = list(object({
    subnet_id = string
    public_ip = bool
  }))
  default = [{ "subnet_id" = null, "public_ip" = null }]
}

variable mgmt_securitygroup_ids {
  description = "The Network Security Group ids for management network "
  type        = list(string)
}

variable external_securitygroup_ids {
  description = "The Network Security Group ids for external network "
  type        = list(string)
  default     = []
}

variable internal_securitygroup_ids {
  description = "The Network Security Group ids for internal network "
  type        = list(string)
  default     = []
}

## Please check and update the latest DO URL from https://github.com/F5Networks/f5-declarative-onboarding/releases
# always point to a specific version in order to avoid inadvertent configuration inconsistency
variable DO_URL {
  description = "URL to download the BIG-IP Declarative Onboarding module"
  type        = string
  default     = "https://github.com/F5Networks/f5-declarative-onboarding/releases/download/v1.16.0/f5-declarative-onboarding-1.16.0-8.noarch.rpm"
}
## Please check and update the latest AS3 URL from https://github.com/F5Networks/f5-appsvcs-extension/releases/latest 
# always point to a specific version in order to avoid inadvertent configuration inconsistency
variable AS3_URL {
  description = "URL to download the BIG-IP Application Service Extension 3 (AS3) module"
  type        = string
  default     = "https://github.com/F5Networks/f5-appsvcs-extension/releases/download/v3.23.0/f5-appsvcs-3.23.0-5.noarch.rpm"
}

## Please check and update the latest TS URL from https://github.com/F5Networks/f5-telemetry-streaming/releases/latest 
# always point to a specific version in order to avoid inadvertent configuration inconsistency
variable TS_URL {
  description = "URL to download the BIG-IP Telemetry Streaming module"
  type        = string
  default     = "https://github.com/F5Networks/f5-telemetry-streaming/releases/download/v1.15.0/f5-telemetry-1.15.0-4.noarch.rpm"
}

## Please check and update the latest Failover Extension URL from https://github.com/f5devcentral/f5-cloud-failover-extension/releases/latest 
# always point to a specific version in order to avoid inadvertent configuration inconsistency
variable CFE_URL {
  description = "URL to download the BIG-IP Cloud Failover Extension module"
  type        = string
  default     = "https://github.com/F5Networks/f5-cloud-failover-extension/releases/download/v1.6.1/f5-cloud-failover-1.6.1-1.noarch.rpm"
}

## Please check and update the latest FAST URL from https://github.com/F5Networks/f5-appsvcs-templates/releases/latest 
# always point to a specific version in order to avoid inadvertent configuration inconsistency
variable fastPackageUrl {
  description = "URL to download the BIG-IP FAST module"
  type        = string
  default     = "https://github.com/F5Networks/f5-appsvcs-templates/releases/download/v1.4.0/f5-appsvcs-templates-1.4.0-1.noarch.rpm"
}

variable libs_dir {
  description = "Directory on the BIG-IP to download the A&O Toolchain into"
  type        = string
  default     = "/config/cloud/aws/node_modules"
}

variable onboard_log {
  description = "Directory on the BIG-IP to store the cloud-init logs"
  type        = string
  default     = "/var/log/startup-script.log"
}

variable custom_user_data {
  description = "Provide a custom bash script or cloud-init script the BIG-IP will run on creation"
  type        = string
  default     = null
}
