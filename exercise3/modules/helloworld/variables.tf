variable "user" {
  description = "Name of the user"
  type        = string
  default     = "GameThis"
}

variable "likes" {
  description = "List of things the user likes"
  type        = list(string)
  default     = ["Pizza", "Gardening", "Programming"]
}
