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

## Change Docker data-path (Docker version 20.10.7, build f0df350)

1. Create docker setting JSON
```bash
vi /etc/docker/daemon.json
```

2. set `data-root`
```
{
    "data-root": "/var/lib/docker"
}
```

- (Optional) Can used symbolic link

```
ln -s /var/lib/docker WANTEDPATH
```

## Container automatically start option

- [Reference](https://docs.docker.com/config/containers/start-containers-automatically/)

```bash
docker update --restart unless-stopped IMAGE
```

## Usage example

### Container management

- Run, Start containers

```bash
docker run -d IMAGE
```

  - Automatically restart on boot

  ```bash
  docker run --unless-stopped -d IMAGE
  ```

- List, Stop, Remove container

```bash
docker container ls
docker container stop CONTAINERNAME
docer container rm CONTAINERNAME
```

