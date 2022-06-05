# Select Kernel in GRUB (not booting phase)

- [Ref](https://unix.stackexchange.com/questions/198003/set-default-kernel-in-grub)

1. Find `$menuentry_id_option`

```bash
grep submenu /boot/grub/grub.cfg
```

2. Find `$menuentry_id_option` for menuentry

```bash
grep gnulinux /boot/grub/grub.cfg
```
