# Python3

## Requirements for build

```bash
sudo apt build-dep python3
sudo apt install build-essential gdb pkg-config libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev libncurses-dev libreadline-dev libsqlite3-dev libssl-dev lzma lzma-dev tk-dev uuid-dev zlib1g-dev
```

```bash
sudo apt install build-essential libbz2-dev libcurses-ocaml-dev libdbm-deep-perl libgdbm-dev liblzma-dev libsqlite3-dev libssl-dev libreadline-dev zlib1g-dev libtk-img-dev libffi-dev
```

## Configuration for build
```bash
./configure --prefix=/opt/Python3 --enable-optimizations
sudo make install
```

# URL encoded string decode

```python
import urllib.parse
encoded = ''
urllib.parse.unquote(encoded)
```
