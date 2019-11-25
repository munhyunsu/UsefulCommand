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


