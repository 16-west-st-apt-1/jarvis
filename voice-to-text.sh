#!/usr/bin/env bash

# Transcribe a wav file to text with vosk.

INPUT="$1"
TRANSCRIPT="/home/16west/16west-ai/prompt-transcript.txt"

vosk-transcriber -i "$INPUT" -o "$TRANSCRIPT" >/dev/null 2>&1
