# udev 

## Caution
- When reading files in partitions other than the boot and root partitions, rules cannot be loaded at boot time.
- Symptom
  - It does not working at boot time
  - But, it does working with
  ```bash
  udevadm control --reload-rules && udevadm trigger
  ```
