# Virtualbox

## Manage SharedFolder

### Linux Guest

0. Setting SharedFolder

1. Install virtualbox guest addition
```bash
sudo apt install build-essential
sudo mkdir -p /media/cdrom
sudo mount -t iso9660 -o ro /dev/sr0 /media/cdrom
cd /media/cdrom
sudo ./RunVBoxLinuxAddition.sh
```

2. Add user vboxsf group
```bash
sudo usermod -a -G vboxsf USER
```

3. reboot

## Manage VDI

### Compact VDI

  ```bash
  VBoxManage modifyhd {aaaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeeee} --compact
  ```
