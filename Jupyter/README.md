# Jupyter Notebook

## Setup JupyterHub Server

1. Setup virtual environment

```bash
sudo /opt/Python310/bin/python3 -m venv /opt/jupyterhub_venv/
```

2. Install requirement library

```bash
sudo /opt/jupyterhub_venv/bin/python3 -m pip install pip wheel
sudo /opt/jupyterhub_venv/bin/python3 -m pip install jupyterhub jupyterlab
sudo /opt/jupyterhub_venv/bin/python3 -m pip install ipywidgets
```

3. Enable nvm

```bash
source /home/user/.nvm/nvm.sh
source /home/user/.nvm/bash_completion
sudo install npm install -g configurable-http-proxy
```

4. Create configuration

```bash
sudo mkdir -p /opt/jupyterhub/etc/jupyterhub/
cd /opt/jupyterhub/etc/jupyterhub/
sudo /opt/jupyterhub_venv/bin/jupyterhub --generate-config
```

```
# vi /opt/jupyterhub/etc/jupyterhub/jupyterhub_config.py
c.Spawner.default_url = '/lab'
```

5. Setup systemd service

```bash
sudo mkdir -p /opt/jupyterhub/etc/systemd
sudo vi /opt/jupyterhub/etc/systemd/jupyterhub.service
```

- run\_jupyter

```
#!/bin/bash

cd /home/user/.nvm
source nvm.sh

cd /opt/jupyterhub_venv
source bin/activate
/opt/jupyterhub_venv/bin/jupyterhub -f /opt/jupyterhub/etc/jupyterhub/jupyterhub_config.py
```

- .service

```
[Unit]
Description=JupyterHub
After=syslog.target network.target

[Service]
User=root
Environment="PATH=/opt/jupyterhub_venv/bin:/usr/local/texlive/2021/bin/x86_64-linux:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin"
ExecStart=/opt/jupyterhub/etc/systemd/run_jupyterhub

[Install]
WantedBy=multi-user.target
```

- Enable service

```bash
sudo ln -s /opt/jupyterhub/etc/systemd/jupyterhub.service /etc/systemd/system/jupyterhub.service
sudo systemctl daemon-reload
sudo systemctl enable jupyterhub.service
sudo systemctl start jupyterhub.service
sudo systemctl status jupyterhub.service
```

### Jupyterlab upgrade

```bash
sudo -s
source /opt/jupyterhub_venv/bin/activate
```

```bash
/opt/jupyterhub_venv/bin/pip3 install --upgrade -r /home/user/UsefulCommand/Jupyter/requirements.txt
source /home/user/.nvm/nvm.sh
/opt/jupyterhub_venv/bin/jupyter lab build
```

- If jupyterhub produce `set_loginuid failed` error, then delete $HOME/.jupyter


### Jupyter Configuration

- Resolve: Invalid response: 413 Request Entity Too Large

- Set-up nginx client max body size parameter

```
client_max_body_size 1G;
```

### Create Jupyter Lab Kernel

```bash
python3 -m ipykernel install --user --name user-kernel --display-name 'UserKernel'
```

- Install system-wide

```bash
/opt/jupyterhub_venv/bin/python3 -m ipykernel install --name jupyter --display-name 'Jupyter' --prefix=/opt/jupyterhub_venv/
/opt/venv/bin/python3 -m ipykernel install --name new_venv --display-name 'New venv' --prefix=/opt/jupyterhub_venv/
```

### Jupyter lab extension

```bash
# Node
jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-matplotlib
sudo "PATH=$PATH" /opt/jupyterhub/bin/jupyter labextension update --all
```

### As a later, it can be removed by

```bash
jupyter kernelspec list
jupyter kernelspec remove KERNELNAME
```


## Ipykernel management

### Insert Environment variables

```bash
# in deactivate()
    if [ -n "${_OLD_LD_LIBRARY_PATH:-}" ] ; then
        LD_LIBRARY_PATH="${_OLD_LD_LIBRARY_PATH:-}"
        export LD_LIBRARY_PATH
        unset _OLD_LD_LIBRARY_PATH
    fi
# below export PATH
_OLD_LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
LD_LIBRARY_PATH="/home/.../:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH
```

- In jupyter kernel

```json
"env": {"LD_LIBRARY_PATH":"/home/..."},
```

## Export to Latex, broken korea font problem

```bash
vi /opt/jupyterhub_venv/share/jupyter/nbconvert/templates/latex/base.tex.j2
```

```
\usapackage{kotex}
```



# References

- [About ipympl version](https://github.com/matplotlib/ipympl/issues/416)
