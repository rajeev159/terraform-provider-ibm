data "ibm_resource_group" "cos_group" {
  name = var.resource_group_name
}

resource "ibm_resource_instance" "cos_instance_poc" {
  name              = "cos-instance-poc"
  resource_group_id = data.ibm_resource_group.cos_group.id
  service           = var.service_type
  plan              = var.plan_type
  location          = var.location
}

data "ibm_resource_instance" "test" {
  name    = ibm_resource_instance.cos_instance.name
  service = var.service_type
}