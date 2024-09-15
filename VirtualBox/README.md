# Virtualbox

## Installation

## Debian-based linux repository (2024-09-15 Version)

### Add VirtualBox's official GPG key

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc -o /etc/apt/keyrings/virtualbox.asc
sudo chmod a+r /etc/apt/keyrings/virtualbox.asc
```

### Add the repository to Apt sources

```bash
echo \
  "deb [arch=amd64 signed-by=/etc/apt/keyrings/virtualbox.asc] https://download.virtualbox.org/virtualbox/debian $(. /etc/os-release && echo "$UBUNTU_CODENAME") contrib" | \
  sudo tee /etc/apt/sources.list.d/virtualbox.list
```

### Install virtualbox (2024-09-15: VirtualBox 7.1)

```bash
sudo apt update
sudo apt install virtualbox-7.1
sudo usermod -aG vboxusers $USER
```

- why adding the user to `vboxusers` group

```
Can't enumerate USB devices

Failed to enumerate host USB devices.

VirtualBox is not currently allowed to access USB devices. You can change this by adding your user to the 'vboxusers' group. Please see the user manual for a more detailed explanation.
```

## References

- [Official Website](https://www.virtualbox.org/)
- [Debian-based linux installation](https://www.virtualbox.org/wiki/Linux_Downloads)

1. install virtualbox dkms (even with SecureBoot)
```bash
apt install --reinstall virtualbox-dkms
```

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
