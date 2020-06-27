# FFmpeg commands

## Installation

### Linux
- Download precompiled binary [Link](https://www.ffmpeg.org/download.html)
  

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

