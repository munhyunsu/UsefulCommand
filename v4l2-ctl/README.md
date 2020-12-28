# Check configuration

## Get all configuration
```bash
v4l2-ctl --device /dev/video2 --all
```

## Get list formats
```bash
v4l2-ctl --device /dev/vide0 --list-formats-ext
```

## Set parameter
```bash
v4l2-ctl --device /dev/video2 --set-ctrl focus_auto=1
```


