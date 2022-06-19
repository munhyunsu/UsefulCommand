# Installation

- Ubuntu / Linux Mint

```bash
apt install v4l-utils
```

# Check configuration

## Get devices
```bash
v4l2-ctl --list-devices
```

## Get all configuration
```bash
v4l2-ctl --device /dev/video2 --all
```

## Get list formats
```bash
v4l2-ctl --device /dev/video0 --list-formats-ext
```

## Set parameter
```bash
v4l2-ctl --device /dev/video2 --set-ctrl focus_auto=1
```

## Set format parameter
```bash
v4l2-ctl --device /dev/video2 --set-fmt-video=width=1280,height=720
```
