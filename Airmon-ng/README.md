# Turn Network interface to monitor mode

## Requirements
```bash
apt-get install aircrack-ng
```

### Order
1. Check interface status
```bash
iw dev
```

2. Kill applications which use network interface
```bash
airmon-ng check kill
```

3. Start monitor mode
```bash
airmon-ng start wlp2s0
```

4. Change frequency to target it
```bash
iwconfig channel 48
```

5. Monitor

