#!/usr/bin/env bash

# Speak text sent to piper.

# Associative array for piper models.
declare -A MODELS=( ["danny"]="en_US-danny-low.onnx"
                    ["lj"]="en_US-ljspeech-high.onnx"
                    ["ljspeech"]="en_US-ljspeech-high.onnx"
                    ["amy"]="en_US-amy-low.onnx")
# User inputs
MODEL_INDEX="$1"
INPUT_FILE="$2"

# Construct command
MODEL="${MODELS[$MODEL_INDEX]}"

cat "$INPUT_FILE" | piper --model "piper-voices/$MODEL" --output-raw | sudo aplay -r 16000 -f S16_LE -t raw -
