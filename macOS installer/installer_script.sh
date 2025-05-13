#!/bin/bash

# AI4ALL Installer Script
# This script installs all necessary components for the AI4ALL project.

echo "Welcome to the AI4ALL Installer!"

if ! ping -c 1 google.com &> /dev/null; then
    echo "Network connection required for installation."
    exit 1
fi

# Function to check and install Python
install_python() {
  if ! command -v python3 &> /dev/null; then
    echo "Python3 not found. Installing Python3..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
      /opt/homebrew/bin/brew install python
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
      sudo apt-get update && sudo apt-get install -y python3
    else
      echo "Unsupported OS. Please install Python3 manually."
      exit 1
    fi
  else
    echo "Python3 is already installed."
  fi
}

# Function to check and install Node.js
install_node() {
  if ! command -v node &> /dev/null; then
    echo "Node.js not found. Installing Node.js..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
      /opt/homebrew/bin/brew install node
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
      sudo apt-get update && sudo apt-get install -y nodejs npm
    else
      echo "Unsupported OS. Please install Node.js manually."
      exit 1
    fi
  else
    echo "Node.js is already installed."
  fi
}

# Function to check and install Git
install_git() {
  if ! command -v git &> /dev/null; then
    echo "Git not found. Installing Git..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
      /opt/homebrew/bin/brew install git
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
      sudo apt-get update && sudo apt-get install -y git
    else
      echo "Unsupported OS. Please install Git manually."
      exit 1
    fi
  else
    echo "Git is already installed."
  fi
}

# Function to install LLM
install_llm() {
  echo "Installing LLM..."
  # run system_specs_and_llm_installer.sh script
  # This script should be in the same directory as this installer
  if [[ -f "./ai4all-hackathon/macOS installer/system_specs_and_llm_installer.sh" ]]; then
    chmod +x "./ai4all-hackathon/macOS installer/system_specs_and_llm_installer.sh"
    bash "./ai4all-hackathon/macOS installer/system_specs_and_llm_installer.sh"
  else
    echo "LLM installer script not found. Please ensure it's in the same directory."
    exit 1
  fi
}

# Function to install the client
install_client() {
  echo "Installing the AI4ALL client..."
  # Placeholder for client installation logic
  # Example: git clone https://github.com/your-client-repo.git
}

# Function to install MCPs
install_mcps() {
  echo "Installing default MCPs..."
  # Placeholder for MCP installation logic
  # Example: Install filesystem mapping, PowerPoint, Excel, etc.
}

# Main installation steps
install_python
install_node
install_git
install_llm
install_client
install_mcps

echo "AI4ALL installation complete!"
