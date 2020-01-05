variable "input" {
  type=string
}

variable "times" {
  type=number
}

resource "null_resource" "encrypt" {
  provisioner "local-exec" {
    command = "./encrypt.py ${var.input} ${var.times}"
  }
}