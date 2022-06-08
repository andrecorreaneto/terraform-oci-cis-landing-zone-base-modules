# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

data "oci_identity_compartments" "target_compartment" {
    compartment_id = var.tenancy_id
    access_level = "ANY"
    compartment_id_in_subtree = true
    filter {
        name = "name"
        values = [var.target_compartment]
    }
}

data "oci_identity_compartment" "target_compartment" {
    id = var.target_compartment
}

data "oci_identity_compartments" "network_compartment" {
    compartment_id = var.tenancy_id
    access_level = "ANY"
    compartment_id_in_subtree = true
    filter {
        name = "name"
        values = [var.network_compartment]
    }
}

data "oci_identity_compartment" "network_compartment" {
    id = var.network_compartment
}

data "oci_core_vcns" "these" {
    compartment_id = local.network_compartment_id
}

data "oci_core_subnets" "these" {
    compartment_id = local.network_compartment_id
}