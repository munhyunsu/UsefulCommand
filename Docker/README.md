# Docker installation and management example

## Installation

- [Install on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
  - Linux Mint 20.1 Ulyssa based on Ubuntu 20.04 Focal

## (Recommended) Running docker on a non-root user

- [Guide: Post-installation steps for Linux](https://docs.docker.com/engine/install/linux-postinstall/)

```bash
sudo usermod -aG docker $USER
```

## Create Docker Network

### Default Docker network list

- [Reference](https://docs.docker.com/engine/tutorials/networkingcontainers/)

```bash
$ docker network ls

NETWORK ID          NAME                DRIVER
18a2866682b8        none                null
c288470c46f6        host                host
7b369448dccb        bridge              bridge
```

## Usage example

### Container management

- List container

```bash
docker container ls
```

- Stop and remove container

```bash
docker container stop CONTAINERNAME
docer container rm CONTAINERNAME
```
