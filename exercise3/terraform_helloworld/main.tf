terraform {
  required_version = ">= 1.0.0"
}

provider "local" {}

resource "local_file" "helloworld" {
  filename = "${path.module}/HelloWorld.txt"
  content  = <<EOT
Hello NONAME,

Welcome to terraform templating!
Can you list 3 things you like?

Provide List here:

- BonkeyWonkers
EOT
}
