# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  description = "The project ID to create the resources in."
  type        = string
  default     = "" #Correct project id
}

variable "region" {
  description = "The region to create the resources in."
  type        = string
  default     = "" # Region to be provided
}

variable "zone" {
  description = "The availability zone to create the sample compute instances in. Must within the region specified in 'var.region'"
  type        = string
  default     = "" # zone to be provided
}




# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
  default     = "" # load balancer name to be provided
}

variable "custom_labels" {
  description = "A map of custom labels to apply to the resources. The key is the label name and the value is the label value."
  type        = map(string)
  default     = {}
}

variable "network" {
  description = "Self link of the VPC network in which to deploy the resources."
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Self link of the VPC subnetwork in which to deploy the resources."
  type        = string
  default     = ""
}

