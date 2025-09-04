terraform {
  required_version = ">= 1.0.0"
  }

  provider "local" {}

  variable "name" {
    type    = string
      default = "GameThis"
      }

      variable "likes" {
        type    = list(string)
	  default = ["Pizza", "Gardening", "Programming"]
	  }

	  resource "local_file" "helloworld" {
	    filename = "${path.module}/HelloWorld.txt"
	      content  = templatefile("${path.module}/HelloWorld.tftpl", {
	          name  = var.name
		      likes = var.likes
		        })
			}

