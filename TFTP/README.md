# Using docker

## Container ready

```bash
ocker run --interactive --tty --detach --name tftp --publish 69:69/udp --volume ~/tftpboot:/var/lib/tftpboot:ro ubuntu:24.04
```

## TFTP server setup using Ubuntu image base

1. Update system packages

```bash
apt update
apt dist-upgrade
```

2. Configure timezone

```bash
```

3. Install TFTP server

```
```
