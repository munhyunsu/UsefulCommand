# mitm proxy manual

# System certificates for Android 7 after

1. Install Android Studio and Android Sdk

2. Create Android Virtual Device (AVD)

- We must create AVD non production mode (no marked Google Play)

- This manual create AVD with API level 30

3. Add `emulator` and `adb` to `$PATH`

```bash
export PATH=${PATH}:${HOME}/Android/Sdk/emulator
export PATH=${PATH}:${HOME}/Android/Sdk/platform-tools
echo $PATH
```

4. (Optional) Create mitmproxy CA certificate

- When? First or mitmproxy CA certificate was expired

```bash
rm -rf $HOME/.mitmproxy
mitmproxy
```

5. Copy and rename mitmproxy CA certificate

- Why? Android store CA certificate by the name of their hash, with a '0' as extension

```bash
cd $HOME/.mitmproxy
hashed_name=`openssl x509 -inform PEM -subject_hash_old -in mitmproxy-ca-cert.cer | head -1` && cp mitmproxy-ca-cert.cer $hashed_name.0
```

6. Start AVD with `writable-system` option

```bash
emulator -list-avds
emulator -avd AVDNAME -writable-system [-show-kernel]
```

- In other terminal

```bash
adb root
adb shell avbctl disable-verification
adb reboot
adb root
adb remount
adb reboot
adb root
adb remount
adb push $HOME/.mitmproxy/hashed_name.0 /system/etc/security/cacerts
adb shell chmod 644 /system/etc/security/cacerts/hashed_name.0
adb reboot
```

## References

- [Install System CA Certificate on Android Emulator](https://docs.mitmproxy.org/stable/howto-install-system-trusted-ca-android/)
