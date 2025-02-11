data "ibm_resource_group" "group" {
  name = var.resource_group
}

resource "ibm_resource_instance" "resource_instance" {
  name              = var.service_name
  service           = var.service_type
  plan              = var.plan
  location          = var.location
  resource_group_id = data.ibm_resource_group.group.id
  tags              = ["tag1", "tag2"]

  parameters = {
    "HMAC" = true
  }
  //User can increase timeouts 
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

resource "ibm_cos_bucket" "standard-ams03" {
  bucket_name          = var.bucket_name
  resource_instance_id = ibm_resource_instance.resource_instance.id
  single_site_location = "sjc04"
  #cross_region_location = var.region
  storage_class        = var.storage
}
