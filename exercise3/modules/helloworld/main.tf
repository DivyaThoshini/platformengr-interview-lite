resource "local_file" "helloworld" {
  filename = "${path.module}/HelloWorld.txt"
  content  = templatefile("${path.module}/templates/HelloWorld.tftpl", {
    user  = var.user
    likes = var.likes
  })
}
