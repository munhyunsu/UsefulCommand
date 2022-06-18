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

## Merge video and audio if diffrent meta

- Need to rescale for same resolutions

```bash
ffmpeg -i zoom_0.mp4 -vf scale=1280:720,fps=60 -c:v libx264 -c:a aac -ac 2 -b:a 158k o.mp4
```

- Merge

```bash
ffmpeg -i 1.mp4 -i 2.mp4 -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" merged.mp4
```

## Capture webcam using FFmpeg

```bash
ffmpeg -f alsa -i hw:0 -f video4linux2 -s 640x480 -i /dev/video0 -r 30 -b:v 5000k -f matroska - | mpv --demuxer=mkv /dev/stdin
```

- [Ref1](https://unix.stackexchange.com/questions/2302/can-i-pipe-dev-video-over-ssh)
- [Ref2](https://unix.stackexchange.com/questions/116919/redirect-sound-microphone-via-ssh-how-to-telephone-via-ssh/116921#116921)

## Encode using VAAPI on Linux

```bash
apt install vainfo intel-mesa-driver-non-free
```

- [Ref](https://wiki.debian.org/HardwareVideoAcceleration#VA-API)

## Change frame per seconds (fps)

- Official wiki [Link](https://trac.ffmpeg.org/wiki/ChangingFrameRate)

```bash
ffmpeg -i <input> -filter:v fps=30 <output>
```

- Without re-encoding (only downscale fps)

```bash
ffprobe input.mp4
ffmpeg -i input.mp4 -c copy -f h264 output.h264
ffmpeg -i input.mp4 -vn -acodec copy output.aac
ffmpeg -y -r 24 -i output.h264 -i output.aac -c copy output.mp4
```

- using -r options

```bash
ffmpeg -r 30 -i input.mp4 output.mp4
```

## Extract only audio

- `-vn`: no video
- `-acodec copy`: copy codec of original file

```bash
ffmpeg -i input.mp4 -vn -acodec copy output.aac
```

- `-vn`: no video
- `-ar`: sampling frequency (48000)
- `-ac`: audio channel (2)
- `-b:a`: bitrate (320k)

```bash
ffmpeg -i input.mp4 -vn -ar 48000 -ac 2 -b:a 320k output.mp3
```

## Merged video of video1 and audio of video2

```bash
ffmpeg -i video1.mp4 -i video2.mp4 -c copy -map 0:v:0 -map 1:a:0 output.mp4
```

```bash
ffmpeg -i video1.mp4 -i video2.mp4 -c copy -c:s copy -map 0:v:0 -map 1:a:0 -map 0:s:0 output.mp4
```


## Resize video

```bash
ffmpeg -i video.mp4 -vf scale=1920:-1 -scodec copy output.mp4
```

## Open RTSP Server

```bash
ffmpeg -loglevel error -listen 1 -i rtmp://localhost -bufsize 1024k -f matroska - | mpv --demuxer=mkv /dev/stdin
```

## Blur video

```bash
ffmpeg -i INPUTVIDEO.mp4 -i INPUTMASK.jpg -filter_complex "[0:v][1:v]alphamerge,boxblur=50[alf];[0:v][alf]overlay[v]" -map "[v]" -map 0:a -map 0:s -c:v libx264 -c:a copy -c:s copy OUTPUTVIDEO.mp4;
```

## Capture Video using VAAPI

```bash
ffmpeg -thread_queue_size 4096k -vaapi_device /dev/dri/renderD128 -f video4linux2 -video_size 1280x720 -input_format mjpeg -framerate 60 -i /dev/video2 -thread_queue_size 4096k -f alsa -channels 2 -sample_rate 48000 -i default -bufsize 1024k -vf 'hwupload,scale_vaapi=format=nv12' -qp 20 -c:v h264_vaapi -c:a aac -f matroska output.mkv
```

## Capture Video using 

```bash
ffmpeg -hwaccel cuvid -c:v h264_cuvid cuvid -i /dev/video0 -video_size 1280x720 -input_format mjpeg
```

# Good References

- [ ffmpeg livestreaming to youtube via Nvidia's NVENC and Intel's VAAPI on supported hardware](https://gist.github.com/Brainiarc7/7b6049aac3145927ae1cfeafc8f682c1)
