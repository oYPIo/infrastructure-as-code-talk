# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN ECS CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_ecs_cluster" "example_cluster" {
  name = "${var.name}"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AUTO SCALING GROUP (ASG)
# Each EC2 Instance in the ASG will register as an ECS Cluster Instance.
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_autoscaling_group" "ecs_cluster_instances" {
  name = "${var.name}"
  min_size = "${var.size}"
  max_size = "${var.size}"
  launch_configuration = "${aws_launch_configuration.ecs_instance.name}"
  vpc_zone_identifier = ["${var.subnet_ids}"]

  tag {
    key = "Name"
    value = "${var.name}"
    propagate_at_launch = true
  }
}