locals {
  setup_client = templatefile("${path.module}/scripts/setup_client.tftpl.sh", {
    route_53_resolver_address = var.route_53_resolver_address
    enable_docker_plugin      = var.enable_docker_plugin
    nomad_join_tag_key        = "nomad_ec2_join"
    nomad_join_tag_value      = var.nomad_join_tag_value
    nomad_client_cfg = templatefile("${path.module}/templates/nomad.tftpl", {
      nomad_dc         = var.cluster_name
      nomad_acl_enable = var.nomad_acl_enable
    })
    nomad_file_limit = var.nomad_file_limit
  })
}