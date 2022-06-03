# List default sink and source

```bash
pactl info
```

# Set source or sink volume

```
pactl set-sink-volume 0 100%
pactl set-source-volume 0 100%
```

# Set a default sink

- List sinks

```bash
pactl list sinks
pactl list short sinks
```

- Set default sink

```bash
pactl set-default-sink 0
```

# Set a default source

- List sources

```bash
pactl list sources
pactl list short sources
```

- Set default source

```
pactl set-default-source 0
```

# Loopback interface

```bash
pactl load-module module-loopback latency_msec=1
```

- bash script ([Ref](https://gist.github.com/iamc/22ec9d65d020c7e09e8abf2d9e210de1))

- Very nice cycling example ([Ref](https://itectec.com/ubuntu/ubuntu-share-an-audio-playback-stream-through-a-live-audio-video-conversation-like-skype/))

- Redirecting to virtual Sink ([Ref](https://unix.stackexchange.com/questions/576785/redirecting-pulseaudio-sink-to-a-virtual-source))

# Echo cancel

```bash
pactl load-module module-echo-cancel aec_method=webrtc channels=2
```

# Not affected by master volume

```bash
pactl load-module module-null-sink sink_name=recsink sink_properties=device.description=RecSink
pactl load-module module-loopback source=recsink.monitor sink=SPEAKER latency_msec=1
```
