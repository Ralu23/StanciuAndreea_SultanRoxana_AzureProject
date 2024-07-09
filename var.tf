
variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "Size of the virtual machines"
  type        = string
  default     = "Standard_B1s"
}

variable "vm_image" {
  description = "Image for the virtual machines"
  type        = string
  default     = "22_04-lts"
}
