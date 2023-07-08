variable "project_id" {
  description = "The ID of your project"
  type        = string
}

variable "region" {
  description = "Region to deploy resources"
  type        = string
}

variable "account_id" {
  description = "The ID of the account"
  type        = string
}

variable "display_name" {
  description = "The display name of the service account"
  type        = string
}

variable "role" {
  description = "The role to assign"
  type        = string
}

variable "pool_id" {
  description = "The ID of the identity pool"
  type        = string
}

variable "pool_display_name" {
  description = "The display name of the identity pool"
  type        = string
}

variable "provider_id" {
  description = "The ID of the provider"
  type        = string
}

variable "repository_id" {
  description = "The name of the artifactory repository where docker image is stored"
  type        = string
}

variable "image_name" {
  description = "The name to assign the docker image when built in gh action"
  type        = string
}