# FFmpeg commands

## Installation

### Precompiled binary for debian
- Download precompiled binary [Link](https://www.ffmpeg.org/download.html)

### Custom compile
1. Install dependencies and Set environment variables
    ```bash
    apt install autoconf automake build-essential cmake git-core libass-dev libfreetype6-dev libgnutls28-dev libsdl2-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo wget yasm zlib1g-dev

    export PATH="/opt/ffmpeg/bin:${PATH}"

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
    ./configure --enable-static --enable-pic
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
    ```

1. libmp3lame
    ```bash
    wget -O lame-3.100.tar.gz https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
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

1. FFmpeg
    ```bash
    wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
    tar xjvf ffmpeg-snapshot.tar.bz2
    cd ffmpeg
    ./configure --prefix="/opt/ffmpeg" --pkg-config-flags="--static" --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs="-lpthread -lm" --enable-gpl --enable-gnutls --enable-libaom --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --enable-nonfree
    make
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

