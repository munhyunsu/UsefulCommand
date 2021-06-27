# VAAPI on Linux
- installation

```bash
apt install vainfo intel-mesa-driver-non-free
```

- profile

```
Profile: High
Level: Auto
Rate Control: CBR
Bitrate: 5530Kbps
Ketframe interval: 0
```

# Bitrate calculation

```
BITRATE(kbps) = (WIDTH * HEIGHT * FRAMERATE * BPP) / 1000
```

## Bits per pixel
- High motion (all screen chage): 0.1
- Low motion (1/3 of screen change): 0.06
```
