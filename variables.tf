variable "cidr_block" {
    description = "Range of cidr_block"
    type        = list(any)
    default     = ["10.0.0.0/16"]
}

variable "ami" {
    description = "ami name"
    type        = string
    default     = "ami-0ac4dfaf1c5c0cce9"
}