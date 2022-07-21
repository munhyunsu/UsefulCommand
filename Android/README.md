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

3. Determine the package name of the app

- If we are confused about the package name, please refer to the Play Store

```bash
adb -s serial shell pm list packages
```

4. Get the full path name of the apk file for the target package

```bash
adb -s serial shell pm path package
```

