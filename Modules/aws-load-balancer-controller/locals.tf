locals {
  oidc_to_provider = split("/", var.oidc)[4]
}