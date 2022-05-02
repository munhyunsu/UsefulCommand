# Add / Remove ppa

## Add repository

```bash
add-apt-repository ppa:[PPANAME]
```

## Remove repository

```bash
add-apt-repository --remove ppa:[PPANAME]
```

## Remove and purge repository (Uninstall packages using target ppa)

```bash
apt install ppa-purge
ppa-purge ppa:[PPANAME]
```

## update-initramfs

### Generating /boot/initrd.img-5.3.0-23-generic
- [Ref](https://askubuntu.com/questions/832524/possible-missing-frmware-lib-firmware-i915)
- Warnign messages
```bash
update-initramfs: Generating /boot/initrd.img-5.3.0-23-generic
W: Possible missing firmware /lib/firmware/i915/icl_guc_32.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/glk_guc_32.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/kbl_guc_32.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/bxt_guc_32.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/skl_guc_32.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/icl_huc_ver8_4_3238.bin for module i915
W: Possible missing firmware /lib/firmware/i915/glk_huc_ver03_01_2893.bin for module i915
W: Possible missing firmware /lib/firmware/i915/bxt_huc_ver01_8_2893.bin for module i915
```

  1. Download git linux firmware
    ```bash
    git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
    ```

  2. Copy some Graphic drivers
    ```
    ```


