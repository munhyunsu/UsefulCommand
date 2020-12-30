#!/bin/bash

DEV=/dev/dnlab/c920

if [ -f "${DEV}" ]; then
    v4l2-ctl --device ${DEV} --set-ctrl brightness=0
    v4l2-ctl --device ${DEV} --set-ctrl contrast=128
    v4l2-ctl --device ${DEV} --set-ctrl saturation=128
    v4l2-ctl --device ${DEV} --set-ctrl white_balance_temperature_auto=1
    v4l2-ctl --device ${DEV} --set-ctrl gain=0
    v4l2-ctl --device ${DEV} --set-ctrl power_line_frequency=2
    v4l2-ctl --device ${DEV} --set-ctrl white_balance_temperature_auto=0
    v4l2-ctl --device ${DEV} --set-ctrl white_balance_temperature=4000
    v4l2-ctl --device ${DEV} --set-ctrl white_balance_temperature_auto=1
    v4l2-ctl --device ${DEV} --set-ctrl sharpness=128
    v4l2-ctl --device ${DEV} --set-ctrl backlight_compensation=0
    v4l2-ctl --device ${DEV} --set-ctrl exposure_auto=3
    v4l2-ctl --device ${DEV} --set-ctrl exposure_auto=1
    v4l2-ctl --device ${DEV} --set-ctrl exposure_absolute=250
    v4l2-ctl --device ${DEV} --set-ctrl exposure_auto=3
    v4l2-ctl --device ${DEV} --set-ctrl exposure_auto_priority=0
    v4l2-ctl --device ${DEV} --set-ctrl pan_absolute=0
    v4l2-ctl --device ${DEV} --set-ctrl tilt_absolute=0
    v4l2-ctl --device ${DEV} --set-ctrl focus_auto=0
    v4l2-ctl --device ${DEV} --set-ctrl focus_absolute=0
    v4l2-ctl --device ${DEV} --set-ctrl focus_auto=1
    v4l2-ctl --device ${DEV} --set-ctrl zoom_absolute=100
    v4l2-ctl --device ${DEV} --set-ctrl led1_mode=3
    v4l2-ctl --device ${DEV} --set-ctrl led1_frequency=0
    v4l2-ctl --device ${DEV} --set-fmt-video=width=1280,height=720,pixelformat=MJPG
    v4l2-ctl --device ${DEV} --set-parm 30
else
    echo "${DEV} does not exist."
fi
