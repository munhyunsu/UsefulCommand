# Using docker

## Container ready

```bash
ocker run --interactive --tty --detach --name tftp --publish 69:69/udp --volume ~/tftpboot:/var/lib/tftpboot:ro ubuntu:24.04
```

