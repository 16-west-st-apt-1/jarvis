#!/usr/bin/env bash

# Master script to run:
# 1) Audio recording
# 2) Voice to Text
# 3) ChatGPT Query
# 4) Text to Speech

AUDIO_SNIPPET_TIME=5
PROMPT_HEADER="Answer like a home assistant. Do not use newlines in responses.\
    Do not use markdown formatting. Present lists with a colon and identify\
    list items with numbers and divide list items with semicolons."

# Record audio
echo -e "\n\nRECORDING AUDIO...\n\n"
sudo ./record-audio-snippet.sh "$AUDIO_SNIPPET_TIME"
#clear

# Voice to Text, puts text in ./prompt-transcript.txt
echo -e "\n\nSPEECH TO TEXT...\n\n"
./voice-to-text.sh ./prompt.wav

# Add ChatGPT header to prompt transcript.
sed -i "1s/^/$PROMPT_HEADER\n/" ./prompt-transcript.txt
#clear

# Stream ChatGPT query to piper then to aplay.
echo -e "\n\nSTREAMING TEXT TO CHAPTGPT AND STREAMING TEXT TO SPEECH RESPONSE TO APLAY...\n\n"
cat ./prompt-transcript.txt | sgpt | piper --model "piper-voices/en_US-amy-low.onnx" --output-raw | sudo aplay -r 16000 -f S16_LE -t raw -
#clear

echo -e "\n\nDONE.\n\n"

# Piper text to speech all-in-one
# ./speak-text-with-piper.sh lj "./gpt-response.txt"

### OR
# Save piper text to speech to file
#./text-to-speech-piper.sh lj gpt-response.txt

# Play audio file
#sudo aplay ./gpt-response.wav
