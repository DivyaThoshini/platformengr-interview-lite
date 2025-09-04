terraform {
  required_version = ">= 1.0.0"
  }

  provider "local" {}

  resource "local_file" "helloworld" {
    filename = "${path.module}/HelloWorld.txt"
      content  = "Hello, World!"
      }
