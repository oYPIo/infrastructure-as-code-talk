terraform {
  required_version = "> 0.9.0"
}

provider "aws" {
  region = "${var.region}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE ECS CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

module "ecs_cluster_photos" {
  source = "./my_ecs-cluster"

  name = "ecs photos claster"
  size = 6
  instance_type = "t2.micro"
  key_pair_name = "${var.key_pair_name}"

  vpc_id = "${data.aws_vpc.iasa_vpc.id}"
  subnet_ids = ["${data.aws_subnet.iasa_subnet.*.id}"]

  # To keep the example simple to test, we allow SSH access from anywhere. In real-world use cases, you should lock 
  # this down just to trusted IP addresses.
  allow_ssh_from_cidr_blocks = ["0.0.0.0/0"]

  # Here, we allow the EC2 Instances in the ECS Cluster to recieve requests on the ports used by the rails-frontend
  # and sinatra-backend. To keep the example simple to test, we allow these requests from any IP, but in real-world
  # use cases, you should lock this down to just the IP addresses of the ELB and other trusted parties.
  allow_inbound_ports_and_cidr_blocks = "${map(
    var.rails_frontend_port, "0.0.0.0/0",
    var.sinatra_backend_port, "0.0.0.0/0"
  )}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE SINATRA BACKEND APP AND AN ELB FOR IT
# ---------------------------------------------------------------------------------------------------------------------

module "Profile_microservice" {

  source = "./my_ecs-service"

  name = "Profile_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.profile_microservice_image}"
  image_version = "${var.profile_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.profile_microservice_port}"
  host_port = "${var.profile_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}

module "Locations_microservice" {

  source = "./my_ecs-service"

  name = "Locations_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.locations_microservice_image}"
  image_version = "${var.locations_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.locations_microservice_port}"
  host_port = "${var.locations_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}

module "Sign_facebook_and_instagram" {

  source = "./my_ecs-service"

  name = "Sign_facebook_and_instagram"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.sign_facebook_and_instagram_image}"
  image_version = "${var.sign_facebook_and_instagram_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.sign_facebook_and_instagram_port}"
  host_port = "${var.sign_facebook_and_instagram_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}


module "Email_microservice" {

  source = "./my_ecs-service"

  name = "Email_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.email_microservice_image}"
  image_version = "${var.email_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.email_microservice_port}"
  host_port = "${var.email_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}


module "Sign_microservice" {

  source = "./my_ecs-service"

  name = "Sign_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.sign_microservice_image}"
  image_version = "${var.sign_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.sign_microservice_port}"
  host_port = "${var.sign_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}

module "Search_microservice" {

  source = "./my_ecs-service"

  name = "Search_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.search_microservice_image}"
  image_version = "${var.search_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.search_microservice_port}"
  host_port = "${var.search_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}

module "Timelaps_microservice" {

  source = "./my_ecs-service"

  name = "Timelaps_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.timelaps_microservice_image}"
  image_version = "${var.timelaps_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.timelaps_microservice_port}"
  host_port = "${var.timelaps_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}

module "Authentication_microservice" {

  source = "./my_ecs-service"

  name = "Authentication_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.authentication_microservice_image}"
  image_version = "${var.authentication_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.authentication_microservice_port}"
  host_port = "${var.authentication_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}


module "Instagram_microservice" {

  source = "./my_ecs-service"

  name = "Instagram_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.instagram_microservice_image}"
  image_version = "${var.instagram_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.instagram_microservice_port}"
  host_port = "${var.instagram_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}

module "Map_and_locations" {

  source = "./my_ecs-service"

  name = "Map_and_locations"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.map_and_locations_image}"
  image_version = "${var.map_and_locations_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.map_and_locations_port}"
  host_port = "${var.map_and_locations_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}


module "Photos_saga" {

  source = "./my_ecs-service"

  name = "Photos_saga"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.photos_saga_image}"
  image_version = "${var.photos_saga_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.photos_saga_port}"
  host_port = "${var.photos_saga_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}

module "Photo_feed_microservice" {

  source = "./my_ecs-service"

  name = "Photo_feed_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.photo_feed_microservice_image}"
  image_version = "${var.photo_feed_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.photo_feed_microservice_port}"
  host_port = "${var.photo_feed_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}


module "Photos_scaling_and_storages_microservice" {

  source = "./my_ecs-service"

  name = "Photos_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.photos_scaling_and_storages_microservice_image}"
  image_version = "${var.photos_scaling_and_storages_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.photos_scaling_and_storages_microservice_port}"
  host_port = "${var.photos_scaling_and_storages_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}


module "Comments_and_favorites" {

  source = "./my_ecs-service"

  name = "Comments_and_favorites"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.comments_and_favorites_image}"
  image_version = "${var.comments_and_favorites_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.comments_and_favorites_port}"
  host_port = "${var.comments_and_favorites_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}


module "Facebook_vertex_microservice" {

  source = "./my_ecs-service"

  name = "Facebook_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.facebook_vertex_microservice_image}"
  image_version = "${var.facebook_vertex_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.facebook_vertex_microservice_port}"
  host_port = "${var.facebook_vertex_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}


module "Service_discovery" {

  source = "./my_ecs-service"

  name = "FService_discovery"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.service_discovery_image}"
  image_version = "${var.service_discovery_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.service_discovery_port}"
  host_port = "${var.service_discovery_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}




module "Photos_microservice_API" {
  source = "./my_ecs-service"

  name = "Photos_microservice_API"
  ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}"
  
  image = "${var.photos_microservice_API_image}"
  image_version = "${var.photos_microservice_API_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.photos_microservice_API_port}"
  host_port = "${var.photos_microservice_API_port}"
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
}



module "Timelapse_microservice" {

  source = "./my_ecs-service"

  name = "Timelapse_microservice"

  /*ecs_cluster_id = "${module.ecs_cluster_photos.ecs_cluster_id}" */
  
  image = "${var.timelapse_microservice_image}"
  image_version = "${var.timelapse_microservice_version}"
  cpu = 1024
  memory = 768
  desired_count = 2
  
  container_port = "${var.timelapse_microservice_port}"
  host_port = "${var.timelapse_microservice_port}"
  
  /* 
  elb_name = "${module.sinatra_backend_elb.elb_name}"

  num_env_vars = 1
  env_vars = "${map("RACK_ENV", "production")}"
  */
}


module "Photos_microservice_API_elb" {
  source = "./my_elb"

  name = "Photos_microservice_API_elb"

  vpc_id = "${data.aws_vpc.iasa_vpc.id}"
  subnet_ids = ["${data.aws_subnet.iasa_subnet.*.id}"]

  instance_port = "${var.photos_microservice_API_port}"
  health_check_path = "health"
}


# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THIS EXAMPLE IN THE DEFAULT SUBNETS OF THE DEFAULT VPC
# To keep this example as easy to use as possible, we deploy into the default subnets of your default VPC. That means
# everything is accessible publicy, which is fine for learning/experimenting, but NOT a good practice for production.
# In real world use cases, you should run your code in the private subnets of a custom VPC.
#
# Note that if you do not have a default VPC (i.e. you have an older AWS account or you deleted the VPC), you will
# need to manually fill in the VPC and subnet IDs above.
# ---------------------------------------------------------------------------------------------------------------------

data "aws_vpc" "iasa_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  
  tags {
    name = "iasa_vpc"
  }
}

data "aws_availability_zones" "available" {}

# Look up the default subnets in the AZs available to this account (up to a max of 3)
data "aws_subnet" "iasa_subnet" {
  count = "${min(length(data.aws_availability_zones.available.names), 3)}"
  default_for_az = true
  vpc_id = "${data.aws_vpc.iasa_vpc.id}"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
}