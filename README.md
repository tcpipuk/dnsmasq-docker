# dnsmasq-docker

This repository contains a Dockerfile for building a lightweight dnsmasq Docker image based on Alpine Linux. It's suitable for use in home networks to provide DNS and DHCP services.

## Prerequisites

- Docker installed on your host machine.
- Docker Hub account for hosting the image (optional, if you're not using auto-builds).

## Building the Image

To build the image manually on your local machine, run the following command in the directory with the Dockerfile:

```sh
docker build -t tcpipuk/dnsmasq:latest .
```

## Configuration

Before running the container, you'll need a `dnsmasq.conf` configuration file on your host system. This file will be mounted into the container to configure dnsmasq.

## Running with Docker Compose

Here is a `docker-compose.yml` example:

```yaml
version: '3.7'

services:
  dnsmasq:
    image: tcpipuk/dnsmasq:latest
    cap_add:
      - NET_ADMIN
    networks:
      lan_network:
        ipv4_address: 192.168.1.2
    volumes:
      - /path/to/your/local/dnsmasq.conf:/etc/dnsmasq.conf
    restart: always

networks:
  lan_network:
    driver: macvlan
    driver_opts:
      parent: enp2s0
    ipam:
      config:
        - subnet: 192.168.1.0/24
```

Replace `/path/to/your/local/dnsmasq.conf` with the actual path to your dnsmasq configuration file on your host system.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to all the contributors of the Alpine Linux and dnsmasq projects.
