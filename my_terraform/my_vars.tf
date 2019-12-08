# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "region" {
  description = "The region where to deploy this code (e.g. us-east-1)."
  default = "us-east-1"
}

variable "key_pair_name" {
  description = "The name of the Key Pair that can be used to SSH to each EC2 instance in the ECS cluster. Leave blank to not include a Key Pair."
  default = ""
}




variable "profile_microservice_image" {
  description = "The name of the Docker image to deploy for the profile_microservice_image (e.g. gruntwork/sinatra-backend)"
  default = "..."
}
variable "profile_microservice_version" {
  description = "The version (i.e. tag) of the Docker container to deploy for the Photos_microservice_API (e.g. latest, 12345)"
  default = "v1"
}
variable "profile_microservice_port" {
  description = "The port the Sinatra backend Docker container listens on for HTTP requests (e.g. 4567)"
  default = 4566
}



variable "locations_microservice_image" {default = "..."}
variable "locations_microservice_version" {default = "v1"}
variable "locations_microservice_port" {default = 4567}


variable "sign_facebook_and_instagram_image" {default = "..."}
variable "sign_facebook_and_instagram_version" {default = "v1"}
variable "sign_facebook_and_instagram_port" {default = 4568}


variable "email_microservice_image" {default = "..."}
variable "email_microservice_version" {default = "v1"}
variable "email_microservice_port" {default = 4569}


variable "sign_microservice_image" {default = "..."}
variable "sign_microservice_version" {default = "v1"}
variable "sign_microservice_port" {default = 4570}


variable "search_microservice_image" {default = "..."}
variable "search_microservice_version" {default = "v1"}
variable "search_microservice_port" {default = 4571}


variable "timelaps_microservice_image" {default = "..."}
variable "timelaps_microservice_version" {default = "v1"}
variable "timelaps_microservice_port" {default = 4572}



variable "authentication_microservice_image" {default = "..."}
variable "authentication_microservice_version" {default = "v1"}
variable "authentication_microservice_port" {default = 4573}


variable "instagram_microservice_image" {default = "..."}
variable "instagram_microservice_version" {default = "v1"}
variable "instagram_microservice_port" {default = 4574}


variable "map_and_locations_image" {default = "..."}
variable "map_and_locations_version" {default = "v1"}
variable "map_and_locations_port" {default = 4575}


variable "photos_saga_image" {default = "..."}
variable "photos_saga_version" {default = "v1"}
variable "photos_saga_port" {default = 4576}


variable "photo_feed_microservice_image" {default = "..."}
variable "photo_feed_microservice_version" {default = "v1"}
variable "photo_feed_microservice_port" {default = 4577}


variable "photos_scaling_and_storages_microservice_image" {default = "..."}
variable "photos_scaling_and_storages_microservice_version" {default = "v1"}
variable "photos_scaling_and_storages_microservice_port" {default = 4578}


variable "comments_and_favorites_image" {default = "..."}
variable "comments_and_favorites_version" {default = "v1"}
variable "comments_and_favorites_port" {default = 4579}


variable "service_discovery_image" {default = "..."}
variable "service_discovery_version" {default = "v1"}
variable "service_discovery_port" {default = 4580}


variable "facebook_vertex_microservice_image" {default = "..."}
variable "facebook_vertex_microservice_version" {default = "v1"}
variable "facebook_vertex_microservice_port" {default = 4580}


variable "photos_microservice_API_image" {default = "..."}
variable "photos_microservice_API_version" {default = "v1"}
variable "photos_microservice_API_port" {default = 4567}




variable "timelapse_microservice_image" {default = "..."}
variable "timelapse_microservice_version" {default = "v1"}
variable "timelapse_microservice_port" {default = 4570}


