# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

/* variable "bastions" {
    description = "Details of the Bastion resources to be created."
    type = map(object({
      name = string,
      compartment_id = string,
      target_subnet_id = string,
      client_cidr_block_allow_list = list(string),
      max_session_ttl_in_seconds = number,
      defined_tags = map(string),
      freeform_tags = map(string)
    }))
} */

variable "tenancy_id" {
  type = string
  default = ""
}

variable "target_compartment" {
  description = "The target compartment name or OCID where the Bastion resources are deployed."
  type = string
  default = ""
}

variable "network_compartment" {
  description = "The VCN compartment name or OCID where the Bastion resources are deployed."
  type = string
  default = ""
}

/* variable "vcn_subnet_pairs" {
  description = "List of VCN/subnet name pairs where Bastion resources are deployed. Examples: ['this-vcn|this-subnet|cidr1,cidr2,...,cidrN','that-vcn|that-subnet|cidr1,cidr2,...,cidrN']"
  type = list(string)
  default = []
}

variable "defined_tags" {
  type = map(string)
  default = null
}

variable "freeform_tags" {
  type = map(string)
  default = null
}

variable "max_session_ttl_in_seconds" {
  type = number
  default  = 10800
} 

variable "separator" {
  type = string
  default = "|"
} */

variable "bastions" {
    description = "Details of the Bastion resources to be created."
    type = map(object({
      name = string,
      vcn_name = string,
      subnet_name = string,
      allowed_cidrs = list(string),
      max_session_ttl_in_seconds = number,
      defined_tags = map(string),
      freeform_tags = map(string)
    }))
}