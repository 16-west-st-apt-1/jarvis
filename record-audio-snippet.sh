#!/usr/bin/env bash

# Record an audio snippet.

LENGTH="$1" # should be integer number of seconds

# Basic audio record command with card 3 (hw:3): ffmpeg -f alsa -i hw:3 -t 30 out.wav
# Use `sudo arecord -l` to get card numbers.
ffmpeg -y -f alsa\
    -i hw:3\
    -acodec pcm_s16le\
    -ac 1\
    -ar 44100\
    -t "$LENGTH" \
    -f wav\
    /home/16west/16west-ai/prompt.wav
