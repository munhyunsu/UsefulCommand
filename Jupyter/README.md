# Jupyter Notebook

### Create Jupyter Lab Kernel
```bash
python3 -m ipykernel install --user --name user-kernel --display-name 'UserKernel'
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
