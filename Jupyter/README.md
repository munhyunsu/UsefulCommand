# Jupyter Notebook

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
