# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

module "lz_bastion" {
    source = "./security/bastion"
    tenancy_id = "ocid1.tenancy.oc1..aaaaaaaaixl3xlr4kr6h3yax2zbijclgim5q2l2pv2qmfithywqhw4tgbvuq"
    target_compartment = "ocid1.compartment.oc1..aaaaaaaauodwzwjewi7wiwr34pich3vngxmmhixc7wudmwdf2iotv2zrtova" #"issue113-security-cmp"
    network_compartment = "issue113-network-cmp"
    bastions = {
        "Bastion1" = {
            name = "myvcnBastion"
            vcn_name = "myvcn"
            subnet_name = "myvcn-middle-subnet"
            allowed_cidrs = ["137.254.7.170/32"]
            max_session_ttl_in_seconds = 10800
            defined_tags = null
            freeform_tags = null
        },
        "Bastion2" = {
            name = "myvcnBastion2"
            vcn_name = "myvcn"
            subnet_name = "myvcn-middle-subnet"
            allowed_cidrs = ["137.254.7.170/32"]
            max_session_ttl_in_seconds = 10800
            defined_tags = null
            freeform_tags = null
        }
    }
}

