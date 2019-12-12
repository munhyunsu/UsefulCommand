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


## Trim videos

  - using *ss* and *t* option
    
    ```bash
    ffmpeg -i FILENAME -ss 00:00:00 -t 00:01:00 -c copy out.mp4
    ```


