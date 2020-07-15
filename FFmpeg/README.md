# FFmpeg commands

## Installation

### Precompiled binary for debian
- Download precompiled binary [Link](https://www.ffmpeg.org/download.html)

### Custom compile
1. Install dependencies and Set environment variables
    ```bash
    apt install autoconf automake build-essential cmake git-core libass-dev libfreetype6-dev libgnutls28-dev libsdl2-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo wget yasm zlib1g-dev libunistring-dev autogen
    export PATH="/opt/ffmpeg/bin:/opt/Python27/bin:${PATH}"
    export PKG_CONFIG_PATH="/opt/ffmpeg/lib/pkgconfig:${PKG_CONFIG_PATH}"
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
    ./configure --prefix="/opt/ffmpeg" --disable-shared --enable-nasm
    make
    ```

1. libopus
    ```bash
    git clone --depth 1 https://github.com/xiph/opus.git
    cd opus
    ./autogen.sh
    ./configure --prefix="/opt/ffmpeg" --disable-shared
    make
    ```

1. libaom
    ```bash
    git clone --depth 1 https://aomedia.googlesource.com/aom
    cd aom
    mkdir -p aom_build
    cd aom_build
    cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/ffmpeg" -DENABLE_SHARED=off -DENABLE_NASM=on ..
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
    
    - Needed?
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

1. FFmpeg
    ```bash
    wget https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
    tar xjvf ffmpeg-snapshot.tar.bz2
    cd ffmpeg
    ./configure --prefix="/opt/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs="-lpthread -lm" --enable-gpl --enable-gnutls --enable-libaom --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --enable-libpulse --enable-nonfree
    make
    ```
    
    ```bash
    ./configure --prefix="/opt/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs="-lpthread -lm" --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-avisynth --enable-gnutls --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-nvenc --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared --enable-version3 --disable-doc --disable-programs --enable-libaribb24 --enable-liblensfun --enable-libopencore_amrnb --enable-libopencore_amrwb --enable-libtesseract --enable-libvo_amrwbenc
    ```

## Concat videos
1. Write down target filenames
```bash
file '/path/to/file1'
file '/path/to/file2'
file '/path/to/file3'
```
2. Excute concatration
```bash
ffmpeg -f concat -safe 0 -i mylist.txt -c copy output
```
    - Alternative method
    ```bash
    ffmpeg -f concat -safe 0 -i <(for f in ./*.wav; do echo "file '$PWD/$f'"; done) -c copy output.wav
    ```

## Trim videos
- using *ss* and *t* option
```bash
ffmpeg -i FILENAME -ss 00:00:30 -t 00:01:00 -c copy out.mp4 # 1 Min video
ffmpeg -i FILENAME -ss 00:00:30 -to 00:01:00 -c copy out.mp4 # 30 Sec video
```

## Fix bad frames
```bash
ffmpeg -i INPUT.mp4 -force_key_frames "expr:(t,n_forced*3)" fixed.mp4
```

## Merge video and audio from two files
- video channel 0 index from 0 index source and audio channel 0 index from 1 index source
```bash
ffmpeg -i A.mp4 -i B.mp3 -c:v copy -map 0:v:0 -map 1:a:0 output.mp4
```

