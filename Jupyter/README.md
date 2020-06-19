# Jupyter Notebook

## Setup Jupyter Remote Server
### Setup Remote SSH Server and Authentication
1. Install and Update Default Packages using Software Manager
1. Install Essential Packages
```bash
sudo apt-get install build-essential vim git openssh-server openssh-client
```
1. Configure Useful Software
  - VIM
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
  autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 " Back to tab from space
  autocmd FileType html setlocal tabstop=2 shiftwidth=2 colorcolumn=0 " Back to tab from space
  autocmd FileType css setlocal tabstop=2 shiftwidth=2 colorcolumn=0 " Back to tab from space
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 colorcolumn=0 " Back to tab from space
  autocmd FileType tex setlocal colorcolumn=0 " Back to color column
  autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
  set colorcolumn=80
  ```
1. Generate RSA Key Pair
  ```bash
  ssh-keygen -t rsa -b 4096
  cd ~/.ssh
  cat id_rsa.pub >> authorized_keys
  ```
  - Copy Private Key using Something like USB
1. Configure Security Option
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
1. Download Python 3 Source Code from [Python.org](https://www.python.org/) and untar
```bash
tar -xvf Python*.tar.gz
```
1. Configure and Compile Python 3
```bash
configure --prefix=/opt/Python38/ --enable-optimizations
sudo make install
```

### Install Node Version Manager
1. Install Node Version Manager from [github](https://github.com/nvm-sh/nvm)

## Manage kernel

### Add Python3 Kernel
1. Install ipykernel
```bash
pip3 install ipykernel
```

2. Add kernel
```bash
python3 -m ipykernel install --user --name some-name --display-name 'Some'
```

### Remove kernel
1. List kernels
```bash
jupyter kernelspec list
```

2. Remove kernel
```bash
jupyter kernelspec remove <kernel_name>
```

### Jupyter lab configuration

1. create config file
```bash
jupyter notebook --generate-config
```

2. generate password hash
```bash
jupyter notebook password
```

3. clean workspace everytime
```
c.NotebookApp.default_url = '/lab?reset
```
