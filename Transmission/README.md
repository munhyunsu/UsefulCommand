# Transmission

# Requirements

- Linux Mint 20.3 (Ubuntu 20.04)

```bash
apt install build-essential automake autoconf libtool pkg-config intltool libcurl4-openssl-dev libglib2.0-dev libevent-dev libminiupnpc-dev libgtk-3-dev libappindicator3-dev libssl-dev libgtkmm-3.0-dev gettext
```

# Build

```bash
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="~/.local/share/transmission" ..
```

# Reference

- [Official Github](https://github.com/transmission/transmission)
