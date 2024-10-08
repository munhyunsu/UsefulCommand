# FFmpeg commands

- Update date: 2024-09-04
- Target OS: Linux Mint 22 (based on Ubuntu 24.4)
- Target ffmpeg version: 7.0.2

## Installation

### Precompiled binary for debian
- Download precompiled binary [Link](https://www.ffmpeg.org/download.html)

### Custom compile

#### Prepare required libraries

1. Install dependencies and Set environment variables

```bash
apt install autoconf automake build-essential cmake git libass-dev libfreetype-dev libgnutls28-dev libmp3lame-dev libsdl2-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev meson ninja-build pkg-config texinfo wget yasm zlib1g-dev libunistring-dev libaom-dev libdav1d-dev
apt install nasm libx264-dev libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libopus-dev libsvtav1-dev libsvtav1enc-dev libsvtav1dec-dev libdav1d-dev
export PATH="/opt/ffmpeg/bin:${PATH}"
export PKG_CONFIG_PATH="/opt/ffmpeg/lib/pkgconfig:${PKG_CONFIG_PATH}"
```

2. Install thirdparty library

```bash
cd FFmpeg
```

- [NASM](https://www.nasm.us/pub/nasm/releasebuilds/): `-DENABLE_NASM=on` in libaom

```bash
wget https://www.nasm.us/pub/nasm/releasebuilds/2.16.02/nasm-2.16.02.tar.bz2
tar xjvf nasm-2.16.02.tar.bz2
cd nasm-2.16.02/
./autogen.sh
./configure --prefix="/opt/ffmpeg"
make
sudo make install
```

- libx264: `--enable-gpl --enable-libx264` in ffmpeg

```bash
git -C x264 pull
git clone --depth 1 https://code.videolan.org/videolan/x264.git
cd x264/
./configure --prefix="/opt/ffmpeg" --enable-static --enable-pic
make
sudo make install
```

- libx265: `--enable-gpl --enable-libx265` in ffmpeg

```bash
apt install libnuma-dev
git -C x265_git pull
git clone https://bitbucket.org/multicoreware/x265_git.git
cd x265/build/linux/
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" -DENABLE_SHARED=off ../../source
make
sudo make install
```

- libvpx: `--enable-libvpx` in ffmpeg

```bash
git -C libvpx pull
git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
cd libvpx
./configure --prefix="/opt/ffmpeg" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm
make
sudo make install
```

- libfdk-aac: `--enable-gpl --enable-nonfree --enable-libfdk-aac` in ffmpeg

```bash
git -C fdk-aac pull
git clone --depth 1 https://github.com/mstorsjo/fdk-aac
cd fdk-aac
autoreconf -fiv
./configure --prefix="/opt/ffmpeg" --disable-shared
make
sudo make install
```

- libopus: `--enable-libopus` in ffmpeg

```bash
git -C opus pull
git clone --depth 1 https://github.com/xiph/opus.git
cd opus
./autogen.sh
./configure --prefix="/opt/ffmpeg" --disable-shared
make
sudo make install
```

- libaom: `--enable-libaom` in ffmpeg

```bash
git -C aom pull
git clone --depth 1 https://aomedia.googlesource.com/aom
mkdir -p aom/aom_build
cd aom/aom_build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" -DENABLE_TESTS=OFF -DENABLE_NASM=on ..
make
sudo make install
```

- libsvtav1: `--enable-libsvtav1` in ffmpeg

```bash
git -C SVT-AV1 pull
git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git
mkdir -p SVT-AV1/build
cd SVT-AV1/build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" -DCMAKE_BUILD_TYPE=Release -DBUILD_DEC=OFF -DBUILD_SHARED_LIBS=OFF ..
make
sudo make install
```

- libdav1d: `--enable-libdav1d` in ffmpeg

```bash
git -C dav1d pull
git clone --depth 1 https://code.videolan.org/videolan/dav1d.git
mkdir -p dav1d/build
cd dav1d/build
meson setup -Denable_tools=false -Denable_tests=false --default-library=static .. --prefix "/opt/ffmpeg" --libdir="/opt/ffmpeg/lib"
ninja
sudo ninja install
```

- [libvmaf](https://github.com/Netflix/vmaf/releases): `--enable-libvmaf` `--ld="g++"` in ffmpeg

```bash
wget -O vmaf-v3.0.0.tar.gz https://github.com/Netflix/vmaf/archive/refs/tags/v3.0.0.tar.gz
tar xvf vmaf-v3.0.0.tar.gz
mkdir -p vmaf-3.0.0/libvmaf/build
cd vmaf-3.0.0/libvmaf/build
meson setup -Denable_tests=false -Denable_docs=false --buildtype=release --default-library=static .. --prefix "/opt/ffmpeg" --bindir="/opt/ffmpeg/bin" --libdir="/opt/ffmpeg/lib"
ninja
ninja install
```


#### Compile FFmpeg

- configure `FFmpeg`

```bash
git -C ffmpeg pull
git clone --depth 1 https://git.ffmpeg.org/ffmpeg.git
cd ffmpeg
./configure --prefix="/opt/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs="-lpthread -lm" --ld="g++" --bindir="/opt/ffmpeg/bin" --enable-gpl --enable-nonfree --enable-libx264 --enable-libx265 --enable-libvpx --enable-libfdk-aac --enable-libopus --enable-libsvtav1 --enable-libdav1d --enable-libvmaf --enable-gnutls --enable-libass --enable-libfreetype --enable-libmp3lame --enable-libvorbis
make
sudo make install
```

- Build infomation: Line 47 in `ffbuild/version.sh`

```bash
WHO="Hyunsu Mun (munhyunsu@gmail.com)"
NEW_REVISION="#define FFMPEG_VERSION \"$version by $WHO\""
```

## MPV.io

#### Install requred libraries

```bash
apt install libxpresent-dev
export PATH="/opt/ffmpeg/bin:${PATH}"
export PKG_CONFIG_PATH="/opt/ffmpeg/lib/pkgconfig:${PKG_CONFIG_PATH}"
```

- [libplacebo](https://github.com/haasn/libplacebo)

```bash
git -C libplacebo pull
git clone --recursive https://code.videolan.org/videolan/libplacebo
mkdir -p libplacebo/build
cd libplacebo/build
meson setup --prefix "/opt/ffmpeg" --libdir="/opt/ffmpeg/lib" -Ddefault_library=static -Dtests=false -Ddemos=false ..
ninja
sudo ninja install
```

- [libass]

```
git -C libass pull
git clone https://github.com/libass/libass.git
cd libass
./autogen.sh
./configure --prefix="/opt/ffmpeg" --disable-shared
make
sudo make install
```

- [liblua5.3](https://www.lua.org/ftp/lua-5.3.6.tar.gz)

```bash
wget https://www.lua.org/ftp/lua-5.2.4.tar.gz
tar xvf lua-5.2.4.tar.gz
cd lua-5.2.4
make linux
sudo make install INSTALL_TOP=/opt/ffmpeg
```

```
cat > lua-5.2.pc << "EOF"
V=5.2
R=5.2.4

prefix=/opt/ffmpeg
INSTALL_BIN=${prefix}/bin
INSTALL_INC=${prefix}/include
INSTALL_LIB=${prefix}/lib
INSTALL_MAN=${prefix}/share/man/man1
INSTALL_LMOD=${prefix}/share/lua/${V}
INSTALL_CMOD=${prefix}/lib/lua/${V}
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: Lua
Description: An Extensible Extension Language
Version: ${R}
Requires:
Libs: -L${libdir} -llua -lm -ldl
Cflags: -I${includedir}
EOF
```


#### Install MPV

- MPV

```bash
git -C mpv pull
git clone --depth 1 https://github.com/mpv-player/mpv.git
mkdir -p mpv/build
cd mpv/build
meson setup --prefix "/opt/ffmpeg" -Dbuildtype=release ..
ninja
sudo ninja install
```




1. NASM

- https://www.nasm.us/pub/nasm/releasebuilds/

```bash
wget https://www.nasm.us/pub/nasm/releasebuilds/2.15.02/nasm-2.15.02.tar.bz2
tar -xvf nasm-2.15.02.tar.bz2
cd nasm-2.15.02
./autogen.sh
./configure --prefix="/opt/ffmpeg"
make
```

1. libx264

```bash
git clone --depth 1 https://code.videolan.org/videolan/x264.git
./configure --prefix="/opt/ffmpeg" --enable-static --enable-pic
make
```

1. libx265

```bash
apt install libnuma-dev
hg clone https://bitbucket.org/multicoreware/x265
cd x265/build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" -DENABLE_SHARED=off ../../source
make
```

1. libvpx

```bash
git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
cd libvpx
./configure --prefix="/opt/ffmpeg" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm
make
```

1. libfdk-aac

```bash
git clone --depth 1 https://github.com/mstorsjo/fdk-aac
cd fdk-aac
autoreconf -fiv
./configure --prefix="/opt/ffmpeg" --disable-shared
make
```

1. libmp3lame

```bash
wget https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
tar -xvf lame-3.100.tar.gz
cd lame-3.100
./configure --prefix="/opt/ffmpeg" --enable-nasm
make
```

1. libopus

```bash
git clone --depth 1 https://github.com/xiph/opus.git
cd opus
./autogen.sh
./configure --prefix="/opt/ffmpeg" --with-pic
make
```

1. libaom

```bash
git clone --depth 1 https://aomedia.googlesource.com/aom
cd aom
mkdir -p aom_build
cd aom_build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" -DBUILD_SHARED_LIBS=on -DENABLE_NASM=on ..
make
```

1. AviSynth

```bash
wget -O AviSynthPlus-3.6.1.tar.gz https://github.com/AviSynth/AviSynthPlus/archive/v3.6.1.tar.gz
tar -xvf AviSynthPlus-3.6.1.tar.gz
cd AviSynthPlus-3.6.1
mkdir avisynth_build
cd avisynth_build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" -DHEADERS_ONLY:bool=on ..
```

1. Chromaprint

```bash
wget -O Chromaprint-1.5.0.tar.gz https://github.com/acoustid/chromaprint/archive/v1.5.0.tar.gz
tar -xvf Chromaprint-1.5.0.tar.gz
cd chromaprint-1.5.0/
mkdir chromaprint_build
cd chromaprint_build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
```

1. Frei0r

```bash
wget -O frei0r-1.7.0.tar.gz https://github.com/dyne/frei0r/archive/v1.7.0.tar.gz
tar -xvf frei0r-1.7.0.tar.gz
cd frei0r-1.7.0
autogen.sh
./configure --prefix="/opt/ffmpeg"
```
    
- Needed (?)

```bash
apt install --install-recommends libopencv-dev libgavl-dev
```

1. LADSPA

```bash
wget -O ladspa.h https://www.ladspa.org/ladspa_sdk/ladspa.h.txt
cp ladspa.h /opt/ffmpeg/include
```

1. ARIB STD-B24

```bash
wget -O aribb24-1.0.3.tar.gz https://github.com/nkoriyama/aribb24/archive/v1.0.3.tar.gz
tar -xvf aribb24-1.0.3.tar.gz
cd aribb24-1.0.3
./bootstrap
./configure --prefix="/opt/ffmpeg"
```

1. Lilv-0

```bash
wget http://lv2plug.in/spec/lv2-1.18.0.tar.bz2
tar -xvf lv2-1.18.0.tar.bz2
cd lv2-1.18.0
./waf configure --prefix="/opt/ffmpeg"
sudo ./waf install
wget http://download.drobilla.net/serd-0.30.4.tar.bz2
tar -xvf serd-0.30.4.tar.bz2
cd serd-0.30.4
./waf configure --prefix="/opt/ffmpeg"
sudo ./waf install
wget http://download.drobilla.net/sord-0.16.4.tar.bz2
tar -xvf sord-0.16.4.tar.bz2
cd sord-0.16.4
./waf configure --prefix="/opt/ffmpeg"
sudo ./waf install
wget http://download.drobilla.net/sratom-0.6.4.tar.bz2
tar -xvf sratom-0.6.4.tar.bz2
cd sratom-0.6.4
./waf configure --prefix="/opt/ffmpeg"
sudo ./waf install
wget http://download.drobilla.net/lilv-0.24.8.tar.bz2
tar -xvf lilv-0.24.8.tar.bz2
cd lilv-0.24.8
./waf configure --prefix="/opt/ffmpeg"
sudo ./waf install
```

1. libiec61883

```bash
https://sourceforge.net/projects/libraw1394/files/libraw1394/libraw1394-2.0.5.tar.gz/download
./configure --prefix="/opt/ffmpeg"
make
https://sourceforge.net/projects/libavc1394/files/libavc1394/libavc1394-0.5.4.tar.gz/download
tar -xvf libavc1394-0.5.4.tar.gz
cd libavc1394-0.5.4
make
wget -O libiec61883-1.2.0.tar.gz https://github.com/Distrotech/libiec61883/archive/v1.2.0.tar.gz
tar -xvf libiec61883-1.2.0.tar.gz
cd libiec61883-1.2.0
./configure --prefix="/opt/ffmpeg"
make
```

1. libbluray

```bash
git clone https://gitlab.gnome.org/GNOME/libxml2.git
cd libxml2
./autogen.sh
./configure --prefix="/opt/ffmpeg"
make
https://ant.apache.org/
cp bin/ant /opt/ffmpeg/bin
https://code.videolan.org/videolan/libudfread/-/releases
tar -xvf libudfread-1.1.0.tar.bz2
cd libudfread-1.1.0
./bootstrap
./configure --prefix="/opt/ffmpeg"
make

git clone https://code.videolan.org/videolan/libbluray.git
cd libbluray
git submodule update --init
./bootstrap
./configure --prefix="/opt/ffmpeg"
make
sudo env PATH=${PATH} make install
```

1. libbs2b

```bash
wget -O libsndfile-1.0.28.tar.gz https://github.com/erikd/libsndfile/archive/1.0.28.tar.gz
tar -xvf libsndfile-1.0.28.tar.gz
./autogen.sh
./configure --prefix="/opt/ffmpeg"
https://sourceforge.net/projects/bs2b/files/libbs2b/3.1.0/libbs2b-3.1.0.tar.gz/download
tar -xvf libbs2b-3.1.0.tar.gz
cd libbs2b-3.1.0
./configure --prefix="/opt/ffmpeg"
LD_LIBRARY_PATH=/opt/ffmpeg/lib/ C_INCLUDE_PATH=/opt/ffmpeg/include/ make
```

1. libcodec2

```bash
wget -O libcodec2-0.9.2.tar.gz https://github.com/drowe67/codec2/archive/v0.9.2.tar.gz
tar -xvf libcodec2-0.9.2.tar.gz
cd codec2-0.9.2
mkdir build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```

1. libdc1394-2

```bash
https://sourceforge.net/projects/libdc1394/files/libdc1394-2/2.2.6/libdc1394-2.2.6.tar.gz/download
tar -xvf libdc1394-2.2.6.tar.gz
cd libdc1394-2.2.6/
./configure --prefix="/opt/ffmpeg" --enable-shared
make
```

1. libflite

```bash
wget http://www.festvox.org/flite/packed/flite-2.1/flite-2.1-release.tar.bz2
tar -xvf flite-2.1-release.tar.bz2
cd flite-2.1-release
./configure --prefix="/opt/ffmpeg" CFLAGS="-fPIC"
make
```

1. libgme

```bash
git clone https://github.com/mcfiredrill/libgme.git
cd libgme
mkdir build
cd build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```
    
1. libgsm

```bash
https://github.com/timothytylee/libgsm
tar -xvf gsm-1.0.19.tar.gz
cd gsm-1.0-pl19
!edit-l74 INSTALL_ROOT=/opt/ffmpeg
!edit-l76 GSM_INSTALL_INC=$(GSM_INSTALL_ROOT)/include
make
```

1. lensfun

- Deprecated since n4.3.1-29-g89daac5fe2

```bash
wget -O lensfun-0.3.95.tar.gz https://github.com/lensfun/lensfun/archive/v0.3.95.tar.gz
tar -xvf lensfun-0.3.95.tar.gz
cd lensfun-0.3.95
mkdir build
cd build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```

- Need after n4.3.1-29

```bash
git clone https://github.com/lensfun/lensfun.git
cd lensfun
mkdir build
cd build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```

1. libmysofa

```bash
wget -O libmysofa-1.1.tar.gz https://github.com/hoene/libmysofa/archive/v1.1.tar.gz
tar -xvf libmysofa-1.1.tar.gz
cd libmysofa-1.1
cd build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```

1. libopencore_amrnb

```bash
https://sourceforge.net/projects/opencore-amr/files/opencore-amr/opencore-amr-0.1.5.tar.gz/download
tar -xvf opencore-amr-0.1.5.tar.gz
cd opencore-amr-0.1.5
./configure --prefix="/opt/ffmpeg"
make
```

1. OpenJPEG

```bash
wget -O openjpeg-2.3.1.tar.gz https://github.com/uclouvain/openjpeg/archive/v2.3.1.tar.gz
tar -xvf openjpeg-2.3.1.tar.gz
cd openjpeg-2.3.1
mkdir build
cd build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```

1. libopenmpt

```bash
wget https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-0.5.0+release.autotools.tar.gz
tar -xvf libopenmpt-0.5.0+release.autotools.tar.gz
cd libopenmpt-0.5.0+release.autotools
./configure --prefix="/opt/ffmpeg"
make
```
    
1. rubberband

```bash
wget http://www.mega-nerd.com/libsamplerate/libsamplerate-0.1.9.tar.gz
tar -xvf libsamplerate-0.1.9.tar.gz
cd libsamplerate-0.1.9
./configure --prefix="/opt/ffmpeg"
make
wget http://www.fftw.org/fftw-3.3.8.tar.gz
tar -xvf fftw-3.3.8.tar.gz
cd fftw-3.3.8
./configure --prefix="/opt/ffmpeg" --enable-shared
make
wget https://code.soundsoftware.ac.uk/attachments/download/2588/vamp-plugin-sdk-2.9.0.tar.gz
tar -xvf vamp-plugin-sdk-2.9.0.tar.gz
cd vamp-plugin-sdk-2.9.0
./configure --prefix="/opt/ffmpeg"
make
wget https://breakfastquay.com/files/releases/rubberband-1.8.2.tar.bz2
tar -xvf rubberband-1.8.2.tar.bz2
cd rubberband-1.8.2
!edit Makefile https://github.com/breakfastquay/rubberband/issues/17
make
```

1. shine

```bash
wget https://github.com/toots/shine/releases/download/3.1.1/shine-3.1.1.tar.gz
tar -xvf shine-3.1.1.tar.gz
cd shine-3.1.1
./configure --prefix="/opt/ffmpeg"
make
```

1. libsoxr

```bash
https://sourceforge.net/projects/soxr/files/soxr-0.1.3-Source.tar.xz/download
tar -xvf soxr-0.1.3-Source.tar.xz
cd soxr-0.1.3-Source
mkdir build
cd build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```

1. tesseract

```bash
wget http://www.leptonica.org/source/leptonica-1.79.0.tar.gz
tar -xvf leptonica-1.79.0.tar.gz
cd leptonica-1.79.0
./configure --prefix="/opt/ffmpeg"
make
wget -O tesseract-4.1.1.tar.gz https://github.com/tesseract-ocr/tesseract/archive/4.1.1.tar.gz
tar -xvf tesseract-4.1.1.tar.gz
cd tesseract-4.1.1
./configure --prefix="/opt/ffmpeg"
make
```

1. libtheora

```bash
git clone https://gitlab.xiph.org/xiph/theora.git
cd theora
./autogen.sh
./configure --prefix="/opt/ffmpeg"
make
```

1. libtwolame

```bash
https://sourceforge.net/projects/twolame/files/twolame/0.4.0/twolame-0.4.0.tar.gz/download?use_mirror=jaist
tar -xvf twolame-0.4.0.tar.gz
cd twolame-0.4.0
./configure --prefix="/opt/ffmpeg"
make    
```

1. vidstab

```bash
wget -O vidstab-1.1.0.tar.gz https://github.com/georgmartius/vid.stab/archive/v1.1.0.tar.gz
tar -xvf vidstab-1.1.0.tar.gz
cd vid.stab-1.1.0
mkdir build
cd build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```

1. libvo_amrwbenc

```bash
https://sourceforge.net/projects/opencore-amr/files/vo-amrwbenc/vo-amrwbenc-0.1.3.tar.gz/download
tar -xvf vo-amrwbenc-0.1.3.tar.gz
cd vo-amrwbenc-0.1.3
./configure --prefix="/opt/ffmpeg"
make
```

1. WavPack (Deprecated after n4.3.1)

```bash
wget http://www.wavpack.com/wavpack-5.3.0.tar.bz2
tar -xvf wavpack-5.3.0.tar.bz2
cd wavpack-5.3.0
./configure --prefix="/opt/ffmpeg"
make
```

1. libwebp

```bash
wget -O libwebp-1.1.0.tar.gz https://github.com/webmproject/libwebp/archive/v1.1.0.tar.gz
tar -xvf libwebp-1.1.0.tar.gz
cd libwebp-1.1.0
autogen.sh
./configure --prefix="/opt/ffmpeg"
make
```

1. libxvid

```bash
wget https://downloads.xvid.com/downloads/xvidcore-1.3.7.tar.gz
tar -xvf xvidcore-1.3.7.tar.gz
cd xvidcore
cd build/generic
./configure --prefix="/opt/ffmpeg"
make
```

1. ZeroMQ

```bash
wget https://github.com/zeromq/libzmq/releases/download/v4.3.2/zeromq-4.3.2.tar.gz
tar -xvf zeromq-4.3.2.tar.gz
cd zeromq-4.3.2
./configure --prefix="/opt/ffmpeg"
make
```

1. ZVBI

```bash
https://sourceforge.net/projects/zapping/files/zvbi/0.2.35/
tar -xvf zvbi-0.2.35.tar.bz2
cd zvbi-0.2.35
./configure --prefix="/opt/ffmpeg"
make
```

1. OpenAL

```bash
wget https://github.com/kcat/openal-soft/archive/openal-soft-1.20.1.tar.gz
tar -xvf openal-soft-1.20.1.tar.gz
cd openal-soft-openal-soft-1.20.1
cd build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```

1. OpenCL

```bash
wget -O opencl-2020.06.16.tar.gz https://github.com/KhronosGroup/OpenCL-ICD-Loader/archive/v2020.06.16.tar.gz
tar -xvf opencl-2020.06.16.tar.gz
cd OpenCL-ICD-Loader-2020.06.16
git clone https://github.com/KhronosGroup/OpenCL-Headers.git
cd OpenCL-Headers
sudo cp -r CL /opt/ffmpeg/include/
cd ../inc
ln -s ../OpenCL-Headers/CL/
cd ..
mkdir build
cd build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" ..
make
```

1. OMX_Core

```bash
https://sourceforge.net/projects/omxil/files/omxil/Bellagio%200.9.3/libomxil-bellagio-0.9.3.tar.gz/download
tar -xvf libomxil-bellagio-0.9.3.tar.gz
cd libomxil-bellagio-0.9.3
cd libomxil-bellagio-0.9.3/include
sudo cp *.h /opt/ffmpeg/include/
```

1. libcdio

```bash
wget https://ftp.gnu.org/gnu/help2man/help2man-1.47.16.tar.xz
tar -xvf help2man-1.47.16.tar.xz
cd help2man-1.47.16
./configure --prefix="/opt/ffmpeg"
make
wget http://git.savannah.gnu.org/cgit/libcdio.git/snapshot/libcdio-release-2.1.0.tar.gz
tar -xvf libcdio-release-2.1.0.tar.gz
cd libcdio-release-2.1.0
./configure --prefix="/opt/ffmpeg"
!edit src/Makefile-l989 uncomments
make
wget -O libcdio-10.2+2.0.1.tar.gz https://github.com/rocky/libcdio-paranoia/archive/release-10.2+2.0.1.tar.gz
tar -xvf libcdio-10.2+2.0.1.tar.gz
cd libcdio-paranoia-release-10.2-2.0.1
./autogen.sh
./configure --prefix="/opt/ffmpeg"
make
```

1. nv-codec-headers

```bash
wget -O nv-codec-headers-10.0.26.0.tar.gz https://github.com/FFmpeg/nv-codec-headers/archive/n10.0.26.0.tar.gz
tar -xvf nv-codec-headers-10.0.26.0.tar.gz
cd nv-codec-headers-n10.0.26.0/
!edit Makefile-l1 PREFIX
```

1. FFmpeg
 
- Download source code

```bash
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
cd ffmpeg
```
    
- Build infomation: vi ffbuild/version.sh

```bash
who="MORE information"
NEW_REVISION="#define FFMPEG_VERSION \"$version $who\""
```
    
- FFmpeg guide version

```bash
./configure --prefix="/opt/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs="-lpthread -lm" --enable-gpl --enable-gnutls --enable-libaom --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --enable-libpulse --enable-nonfree
```
    
- Ubuntu FFmpeg configuration version

  - It deprecated libavresample

```bash
./configure --prefix="/opt/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs="-lpthread -lm -lasound" --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-avisynth --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-nvenc --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-version3 --disable-doc --disable-programs --enable-libaribb24 --enable-liblensfun --enable-libopencore_amrnb --enable-libopencore_amrwb --enable-libtesseract --enable-libvo_amrwbenc
```
    
- Optimization version By LuHa (n4.3.1)

```bash
./configure --prefix="/opt/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs="-lpthread -lm -lasound" --enable-rpath --enable-gpl --enable-avresample --enable-avisynth --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-nvenc --enable-chromaprint --enable-frei0r --enable-libx264 --enable-static --enable-version3 --disable-doc --enable-libaribb24 --enable-liblensfun --enable-libopencore_amrnb --enable-libopencore_amrwb --enable-libtesseract --enable-libvo_amrwbenc --enable-vaapi
```

- Optimization version By LuHa (n4.3.1-29-g89daac5fe2)

```bash
./configure --prefix="/opt/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs="-lpthread -lm -lasound" --enable-rpath --enable-gpl --enable-avisynth --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-nvenc --enable-chromaprint --enable-frei0r --enable-libx264 --enable-static --enable-version3 --disable-doc --enable-libaribb24 --enable-liblensfun --enable-libopencore_amrnb --enable-libopencore_amrwb --enable-libtesseract --enable-libvo_amrwbenc --enable-vaapi
```

- Optimization version By LuHa (n4.4.1)

```bash
./configure --prefix="/opt/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs="-lpthread -lm -lasound" --enable-rpath --enable-gpl --enable-avisynth --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-nvenc --enable-chromaprint --enable-frei0r --enable-libx264 --enable-static --enable-version3 --disable-doc --enable-libaribb24 --enable-liblensfun --enable-libopencore_amrnb --enable-libopencore_amrwb --enable-libtesseract --enable-libvo_amrwbenc --enable-vaapi
```

- 



- Install

```bash
make
sudo make install
```


# mpv

1. LuaJIT

```bash
wget https://luajit.org/download/LuaJIT-2.0.5.tar.gz
tar -xvf LuaJIT-2.0.5.tar.gz
cd LuaJIT-2.0.5
!edit Makefile-l27 PREFIX=/opt/ffmpeg
make
```

1. MuJS

```bash
wget https://mujs.com/downloads/mujs-1.0.7.tar.xz
tar -xvf mujs-1.0.7.tar.xz
cd mujs-1.0.7
!edit Makefile-l5 PREFIX=/opt/ffmpeg
make
```

1. MPV

```bash
./bootstrap.py
./waf configure --prefix=/opt/ffmpeg
./waf
sudo ./waf install
```

# Set a global environmnet variables

- vi /etc/profile.d/ffmpeg.sh

```bash
if [ -d "/opt/ffmpeg" ] ; then
    PATH="/opt/ffmpeg/bin:$PATH"
fi
```
