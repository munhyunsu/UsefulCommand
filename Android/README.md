# Android manual

# Extract apk from Android hardware

1. Add `emulator` and `adb` to `$PATH`

```bash
export PATH=${PATH}:${HOME}/Android/Sdk/emulator
export PATH=${PATH}:${HOME}/Android/Sdk/platform-tools
echo $PATH
```

2. Get Android device serial

```bash
adb devices
```
