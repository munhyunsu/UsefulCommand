# v4l2loopback

## Automatic `modprobe` at boot

- vi `/etc/modules-load.d/v4l2loopback.conf`

```
v4l2loopback
```

- vi `/etc/modprobe.d/v4l2loopback.conf`

```
options v4l2loopback video_nr=10 card_label="Virtual Camera" exclusive_caps=1
```

# Source code

- [Github](https://github.com/umlaeute/v4l2loopback)
