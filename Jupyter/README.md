# Jupyter Notebook

## Manage kernel

### Add Python3 Kernel
  1. Install ipykernel
  ```bash
  pip3 install ipykernel
  ```

  2. Add kernel
  ```bash
  python3 -m ipykernel install --user --name SomeName --display-name 'Some'
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

