terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "1.5.7"
    }
  }
}

#Configuration du provider Docker avec l'hote local
provider "docker" {
  host = "tcp://localhost:8082"
}

#Déclaration de la ressource "docker_image" appelée "build"
resource "docker_image" "build" {
  name = "myimage:1dda3fc0724e" #Nom et tag de l'image Docker
  build = "/home/cytech/ING3/terraformTP" #Chemin vers le Dockerfile
  force_update = true #Force la reconstruction de l'image à chaque fois
}

#Déclaration de la ressource "docker_container" appelée "container"
resource "docker_container" "container" {
  name  = "mycontainer"
  image = docker_image.build.myimage
  ports {
    internal = 80 #Port du conteneur
    external = 8082 #Port de l'hôte
  }
}
