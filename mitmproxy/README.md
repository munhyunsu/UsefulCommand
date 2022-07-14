# mitm proxy manual

# System certificates for Android 7 after

1. Install Android Studio and Android Sdk

2. Create Android Virtual Device (AVD)

- We must create AVD non production mode (no marked Google Play)

3. Add `emulator` and `adb` to `$PATH`

```bash
export PATH=${PATH}:${HOME}/Android/Sdk/emulator
export PATH=${PATH}:${HOME}/Android/Sdk/platform-tools
echo $PATH
```

