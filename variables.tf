variable "cidr_block" {
    description = "Range of cidr_block"
    type        = list(any)
    default     = ["10.0.0.0/16"]
}