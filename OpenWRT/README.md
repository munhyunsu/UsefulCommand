# OpenWRT

## Debrick Archer C7 using UART
- Warning! Check the flash memory 16 Megabytes

### Requirements
```bash
apt-get install gtkterm
```

### Steps
0. Connect TFTP server

  - Connect eth1 to TFTP server (192.168.1.100)

1. Connect UART to home router

  - 115200 baud, 8 bit, no parity, 1 stop bit, no flow control

2. Execute debug mode

  ```bash
  echo 'tpl' > /dev/ttyUSB0
  ```

3. Copy and write firmware

  ```bash
  echo 'tftp 0x81000000 ArcherC7v2_tp_recovery.bin' > /dev/ttyUSB0
  echo 'erase 0x9f020000 +f80000' > /dev/ttyUSB0
  echo 'cp.b 0x81000000 0x9f020000 0xf80000' > /dev/ttyUSB0
  ```

4. Reset home router
  
  ```bash
  echo 'reset' > /dev/ttyUSB0
  ```

## TFTP

1. Install TFTP daemon

```bash
apt install atftpd
```

2. Place file on /srv/tftp
```bash
mv FILE /srv/tftp
chown nobody FILE
```

