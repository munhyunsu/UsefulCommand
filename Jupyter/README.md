# Jupyter Notebook

## Setup JupyterHub Server

1. Setup virtual environment

```bash
sudo /opt/Python39/bin/python3 -m venv /opt/jupyterhub/
```

2. Install requirement library

```bash
sudo /opt/jupyterhub/bin/python3 -m pip install pip wheel
sudo /opt/jupyterhub/bin/python3 -m pip install jupyterhub jupyterlab
sudo /opt/jupyterhub/bin/python3 -m pip install ipywidgets
```

### Create Jupyter Lab Kernel
```bash
python3 -m ipykernel install --user --name user-kernel --display-name 'UserKernel'
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
