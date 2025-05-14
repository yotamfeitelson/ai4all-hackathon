#!/bin/bash

# =========================
# Mistral 7B Installer
# =========================
# This script automates the setup of Mistral 7B with Ollama
# It checks system compatibility, installs Ollama, pulls the model,
# and serves it using MCP

# === System Checks ===
echo "[INFO] Checking system specifications..."

# Check GPU availability (NVIDIA, AMD, or Apple Metal)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v lspci &> /dev/null; then
        gpu_check=$(lspci | grep -i -E 'nvidia|amd')
    else
        echo "[WARNING] 'lspci' not found. Please install it with 'sudo apt-get install pciutils' or 'yum install pciutils'."
        gpu_check=""
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    if system_profiler SPDisplaysDataType | grep -q 'Metal'; then
        echo "[INFO] Apple Metal GPU detected. Optimal performance enabled."
        gpu_check='apple-metal'
    else
        gpu_check=""
    fi
else
    echo "[ERROR] Unsupported OS. Exiting."
    exit 1
fi

if [ -z "$gpu_check" ]; then
    echo "[INFO] No compatible GPU detected. Inference will be on CPU."
    echo "[INFO] Applying quantization for CPU optimization..."
else
    echo "[INFO] GPU detected. Optimal performance enabled."
fi

# Check available disk space
# echo "[INFO] Checking disk space..."
# df -h | grep '^/dev/'

# Check if Ollama is installed
if ! command -v ollama &> /dev/null; then
    echo "[INFO] Ollama not found. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ollama
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "[INFO] Linux detected. Please follow manual installation steps for Ollama at https://ollama.com."
        exit 1
    else
        echo "[ERROR] Unsupported OS. Exiting."
        exit 1
    fi
else
    echo "[INFO] Ollama is already installed."
fi

# === Start Ollama Server ===
echo "[INFO] Starting Ollama server..."
ollama serve &> ollama.log &

# Wait for server to be ready
echo "[INFO] Waiting for Ollama server to be ready..."
sleep 5

# === Detect the Correct Port ===
port=$(grep -oE 'Listening on 127.0.0.1:[0-9]+' ollama.log | awk -F: '{print $2}')

if [ -z "$port" ]; then
    echo "[ERROR] Could not detect Ollama server port. Exiting."
    exit 1
else
    echo "[INFO] Ollama server is running on port $port."
fi

# === Model Download ===
echo "[INFO] Pulling Mistral 7B model..."
ollama pull mistral

# === Optional Quantization for CPU ===
if [ -z "$gpu_check" ]; then
    echo "[INFO] Applying quantization for CPU optimization..."
    if command -v llama.cpp &> /dev/null; then
        echo "[INFO] llama.cpp found. Quantizing with ggml format..."
        llama.cpp quantize mistral-7b.bin mistral-7b-quantized.bin --bits 4
    else
        echo "[WARNING] llama.cpp not found. Skipping quantization."
    fi
fi

# === Final Message ===
echo "[SUCCESS] Mistral 7B is now running locally and ready for MCP requests."
echo "[INFO] Access it at: http://localhost:$port"