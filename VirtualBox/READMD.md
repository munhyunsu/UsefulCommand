# Virtualbox

## Manage SharedFolder

### Linux Guest

0. Setting SharedFolder

1. Install virtualbox guest addition

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
