output "id" {
    description = "Ip to web droplet"
    value="Droplet web: ${digitalocean_droplet.web2.ipv4_address}"
}

output "size" {
    value="Droplet web: ${digitalocean_droplet.web2.size}"
}