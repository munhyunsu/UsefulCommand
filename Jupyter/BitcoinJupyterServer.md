# Jupyter Notebook

## Setup Jupyter Lab Remote Server
### Setup Remote SSH Server and Authentication
1. Install and Update Default Packages using Software Manager
2. Install Essential Packages
```bash
sudo apt-get install build-essential vim git tmux openssh-server openssh-client
```
3. Configure Useful Software
    - Bash (~/.bashrc)
    ```
    force_color_prompt=yes
    ```
    - VIM (~/.vimrc)
    ```
    set number "Indicate Line Number
    set tabstop=4 "Tab Size Setting
    set shiftwidth=4 "Shift Size Setting
    set expandtab "Tab to space
    set autoindent "Auto Indent
    set list "New line and tab
    syntax on "Highlight Syntax
    autocmd FileType make setlocal noexpandtab " Back to tab from space
    autocmd FileType automake setlocal noexpandtab " Back to tab from space
    set colorcolumn=80
    ```
    - Tmux (~/.tmux.conf)
    ```
    set -g mouse on
    ```
4. Generate RSA Key Pair
```bash
ssh-keygen -t rsa -b 4096
cd ~/.ssh
cat id_rsa.pub >> authorized_keys
```
    - Copy Private Key using Something like USB
5. Configure Security Option
    - /etc/ssh/sshd_config
    ```
    PubkeyAuthentication yes
    PasswordAuthentication no
    ```
    - **CAUTION!** Now, after rebooting, you will not be able to access using password. You can only access with a private key.

### Install Python 3 Custom version
1. Install Python 3 Build Library
```bash
sudo apt-get install libbz2-dev libcurses-ocaml-dev libdbm-deep-perl libgdbm-dev liblzma-dev libsqlite3-dev libssl-dev libreadline-dev zlib1g-dev libtk-img-dev libffi-dev
```
2. Download Python 3 Source Code from [Python.org](https://www.python.org/) and untar
```bash
tar -xvf Python*.tar.gz
```
3. Configure and Compile Python 3
```bash
configure --prefix=/opt/Python38/ --enable-optimizations
sudo make install
```

### Install Node Version Manager
1. Install Node Version Manager from [github](https://github.com/nvm-sh/nvm)

### Setup Jupyter Server
1. Create Virtual Environment
```bash
/opt/Python38/bin/python3 -m venv ./venv
source ./venv/bin/activate
pip3 install --upgrade -r requirements.txt
```
2. Configure Jupyter Remote Server
    1. Create Jupyter Configuration File
    ```bash
    jupyter notebook --generate-config
    ```
    2. Create Jupyter Password (As of notebook 5.x)
    ```bash
    jupyter notebook password
    ```
    3. Generate Jupyter Server Certificate ([Ref](https://jupyter-notebook.readthedocs.io/en/stable/public_server.html))
    ```bash
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mykey.key -out mycert.pem
    ```
    4. Configure ~/.jupyter/jupyter_notebook_config.py
    ```
    c.NotebookApp.password = 'HASHINjupyter_notebook_config.json'
    c.NotebookApp.certfile = '.../mycert.pem'
    c.NotebookApp.keyfile = '.../mykey.key'
    c.NotebookApp.ip = '*'
    c.NotebookApp.default_url = '/lab?reset'
    c.NotebookApp.port = 8080
    ```
    5. Create Jupyter Lab Kernel
    ```bash
    python3 -m ipykernel install --user --name user-kernel --display-name 'UserKernel'
    ```
      - As a later, it can be removed by
      ```bash
      jupyter kernelspec list
      jupyter kernelspec remove KERNELNAME
      ```
3. **RUN Jupyter Lab Remote Server**
```bash
jupyter lab --no-browser
```

## Setup HTTPS Jupyter Server on Google Cloud Platform

### Launch Google VM Instance

### Buy Domain Name

### Configure Cloud DNS


## Appends

### Use SQLite3 Latest Version
1. Download SQLite3 Binary from [Official Website](https://www.sqlite.org/download.html)
```bash
mv ./* ~/.local/bin/
```

2. Install Shared Library
```bash
sudo apt-get install libc6:i386 zlib1g:i386
```

### Download Latest Bitcoin Core
1. Download Bitcoin Core from [Official Website](https://bitcoin.org/)

2. Untar and move directory
```bash
mv bitcoin-* ~/.local/share/Bitcoin
```

3. Symbolic link to bitcoin Binary
```bash
cd ~/.local/bin
ln -s ../share/bitcoin/bin/bitcoind
ln -s ../share/bitcoin/bin/bitcoin-cli
```

### Python environments
1. Python pip packages
```bash
git clone https://github.com/munhyunsu/BitcoinAnalysis.git
cd BitcoinAnalysis/BitcoinBlockSampler
pip3 install --upgrade requirements.txt
```
