# OpenWRT

## Debrick Archer C7 using UART

### Requirements
```bash
apt-get install gtkterm
```

### Steps
1. Connect UART to home router
  - 115200 baud, 8 bit, no parity, 1 stop bit, no flow control

2. Execute debug mode
```bash
echo 'tpl' > /dev/ttyUSB0
```

3. 


