# Principal file where I defined resouces and information

data "digitalocean_ssh_key" "cris_ssh" {
    name = "Rita-Home"
}

# Create a web server
resource "digitalocean_droplet" "web2" {
  # ...
  name = "example-terraform"
  image = "ubuntu-18-04-x64"
  monitoring = true
  size = "s-1vcpu-1gb"
  # Add our ssh_key from local machine to remote machine
  ssh_keys = [data.digitalocean_ssh_key.cris_ssh.id]
  region = "nyc3"

    # Connect with droplet
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file("~/.ssh/id_rsa") # I entry to my local pc
    timeout = "2m"
  }

  provisioner "remote-exec" {
      inline = [
          "apt update",
          "apt install nginx -y"
      ]
  }


}

# Domain
# resource "digitalocean_domain" "example_domain" {
#   name = "example.com"
#   ip_address = digitalocean_droplet.web.ipv4_address
# }
# other form to create domain is with: data.digitalocean_droplet....->
# Here we used a droplet exist and es very import the droplet's name