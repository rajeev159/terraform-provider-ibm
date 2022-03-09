data "ibm_resource_group" "cos_group" {
  name = var.resource_group
}

resource "ibm_resource_instance" "resource_cos_instance" {
  name              = var.cos_instance
  resource_group_id = data.ibm_resource_group.cos_group.id
  service           = var.service_type
  plan              = var.plan_type
  location          = var.location
}

data "ibm_resource_instance" "test" {
  name    = ibm_resource_instance.resource_cos_instance.name
  service = var.service_type
}