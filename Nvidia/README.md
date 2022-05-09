# Install Nvidia driver on ubuntu based Linux

## (New) Installation

- [Really good reference](https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07#install-nvidia-graphics-driver-via-apt-get)

0. Remove previous installations

```bash
sudo apt remove --purge nvidia-[TABTAB]
sudo apt autoremove
sudo dpkg -P cuda-[TABTAB]
```

0. Remove previous source list

```bash
# /etc/apt/source.list.d/
# /etc/apt/additional-packages.list
```

0. Install dependencies

```bash
sudo apt install build-essential dkms
```

0. Download and copy the NVIDIA Driver

```
# https://www.nvidia.com/download/index.aspx
scp [SRCPATH] [DSTPATH]
```

0. Stop lightdm

```
sudo systemctl stop lightdm
```

0. Execute the NVIDIA driver runfile

```
chmod +x 
```

- If the error about `nouveau` was occured, create blacklist using nvidia-runfile

```
sudo update-initramfs -u
sudo reboot
# re-excute runfile above
```

0. Download CUDA

- Check the CUDA version supported by TensorFlow according to [TensorFlow Install source](https://www.tensorflow.org/install/source#gpu)

- Download CUDA runfile from [Official Download Page](https://developer.nvidia.com/cuda-toolkit-archive)

- It show broken link, change link like below example

```
https://developer.nvidia.com/cuda-11-2-2-download-archive
=> https://developer.nvidia.com/cuda-11.2.2-download-archive
```

- Download runfile

```bash
# It has three installer: NVIDIA driver (old), CUDA, CUDA sample
wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda_11.2.2_460.32.03_linux.run
```

0. Extract CUDA runfile and install CUDA

```bash
chmod +x cuda_11.2.2_460.32.03_linux.run
# do not install Driver
sudo ./cuda_11.2.2_460.32.03_linux.run
```

0. Add runtime library

```bash
# /usr/local/cuda-11.2/lib64
vi /etc/ld.so.conf.d/cuda-11.2.conf
sudo ldconfig
```

0. Add bin to PATH

```bash
# /usr/local/cuda-11.2/bin
vi /etc/environment
```

0. Download and install [cuDNN](https://developer.nvidia.com/rdp/cudnn-archive)

- NVIDIA Developer account login needed

```bash
sudo cp cudnn-11.2-linux-x64-v8.1.1.33.tgz /usr/local/
sudo tar -xvf cudnn-11.2-linux-x64-v8.1.1.33.tgz
sudo rm cudnn-11.2-linux-x64-v8.1.1.33.tgz
```

## Installation

0. Check the CUDA version supported by TensorFlow

- [Install source](https://www.tensorflow.org/install/source)

0. Install software by manual download official web site

## Reference

- [TensorFlow Nvidia](https://www.tensorflow.org/install/gpu)
- [Nvidia official documentation]()
