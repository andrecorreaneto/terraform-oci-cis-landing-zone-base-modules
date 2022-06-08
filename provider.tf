# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

provider "oci" {
  region               = "us-ashburn-1"
  tenancy_ocid         = "ocid1.tenancy.oc1..aaaaaaaaixl3xlr4kr6h3yax2zbijclgim5q2l2pv2qmfithywqhw4tgbvuq"
  user_ocid            = "ocid1.user.oc1..aaaaaaaalxqallveu54dikz2yvwztfa6aaonjyn7mopu2oyy4hqjjbbdukca"
  fingerprint          = "c1:91:41:6a:65:87:68:02:2e:54:80:db:36:76:54:39"
  private_key_path     = "./private_key.pem"
  private_key_password = ""
}