# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

locals {
    target_compartment_id = length(regexall("^ocid1.compartment.oc.*$", var.target_compartment)) > 0 ? data.oci_identity_compartment.target_compartment.id : data.oci_identity_compartments.target_compartment.compartments[0].id
    network_compartment_id = length(regexall("^ocid1.compartment.oc.*$", var.network_compartment)) > 0 ? data.oci_identity_compartment.network_compartment.id : data.oci_identity_compartments.network_compartment.compartments[0].id
    
    vcns_in_network_compartment = { for v in data.oci_core_vcns.these.virtual_networks : v.display_name => {"id" : v.id} }
    subnets_in_network_compartment = { for s in data.oci_core_subnets.these.subnets : "${s.display_name}-${s.vcn_id}" => {"id" : s.id} }

}

resource "oci_bastion_bastion" "these" {
  for_each = var.bastions
    bastion_type                 = "STANDARD"
    compartment_id               = local.target_compartment_id
    target_subnet_id             = local.subnets_in_network_compartment["${each.value.subnet_name}-${local.vcns_in_network_compartment[each.value.vcn_name].id}"].id
    name                         = each.value.name
    client_cidr_block_allow_list = each.value.allowed_cidrs
    max_session_ttl_in_seconds   = each.value.max_session_ttl_in_seconds 
    defined_tags                 = each.value.defined_tags
    freeform_tags                = merge(each.value.freeform_tags, {"cis-landing-zone" : "bastion-module"})
}
