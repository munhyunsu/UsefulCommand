# Requirement package
```bash
apt install cmake libsdl2-dev libicu-dev gcc pkg-config libspeex-dev libspeexdsp-dev libcurl4-openssl-dev libcrypto++-dev libfontconfig1-dev libfreetype6-dev libpng-dev libssl-dev libzip-dev build-essential make duktape-dev nlohmann-json3-dev libbenchmark-dev
```

## Configure installation
```bash
mkdir build; cd build;
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/OpenRCT2" -DCMAKE_BUILD_TYPE="RelWithDebInfo" ..
make -j5
```

## Install data files
```bash
DESTDIR=. make install
```

