terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

#Configuration du provider Docker avec l'hote local
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

#docker_image appelée build
resource "docker_image" "build" {
  name = "myimage" #Image
  build {context = "/home/cytech/ING3/terraformTP"} #Dockerfile
}

#La ressource docker_container appelée container
resource "docker_container" "container" {
  name  = "mycontainer"
  image = docker_image.build.image_id
  ports {
    internal = 80 #Port conteneur
    external = 8082 #Port hote
  }
}
