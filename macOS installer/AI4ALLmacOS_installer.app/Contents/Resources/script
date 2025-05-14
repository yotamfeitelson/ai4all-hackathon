# #!/bin/bash

# # AI4ALL Installer Script
# # This script installs all necessary components for the AI4ALL project.

# echo "Welcome to the AI4ALL Installer!"
# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# echo "Script directory: $SCRIPT_DIR"


# if ! ping -c 1 google.com &> /dev/null; then
#     echo "Network connection required for installation."
#     exit 1
# fi

# # Function to check and install Python
# install_python() {
#   if ! command -v python3 &> /dev/null; then
#     echo "Python3 not found. Installing Python3..."
#     if [[ "$OSTYPE" == "darwin"* ]]; then
#       brew install python
#     elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
#       sudo apt-get update && sudo apt-get install -y python3
#     else
#       echo "Unsupported OS. Please install Python3 manually."
#       exit 1
#     fi
#   else
#     echo "Python3 is already installed."
#   fi
# }

# # Function to check and install Node.js
# install_node() {
#   if ! command -v node &> /dev/null; then
#     echo "Node.js not found. Installing Node.js..."
#     if [[ "$OSTYPE" == "darwin"* ]]; then
#       brew install node
#     elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
#       sudo apt-get update && sudo apt-get install -y nodejs npm
#     else
#       echo "Unsupported OS. Please install Node.js manually."
#       exit 1
#     fi
#   else
#     echo "Node.js is already installed."
#   fi
# }

# # Function to check and install Git
# install_git() {
#   if ! command -v git &> /dev/null; then
#     echo "Git not found. Installing Git..."
#     if [[ "$OSTYPE" == "darwin"* ]]; then
#       brew install git
#     elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
#       sudo apt-get update && sudo apt-get install -y git
#     else
#       echo "Unsupported OS. Please install Git manually."
#       exit 1
#     fi
#   else
#     echo "Git is already installed."
#   fi
# }

# # Function to install LLM
# install_llm() {
#   echo "Installing LLM..."
#   # run system_specs_and_llm_installer.sh script
#   # This script should be in the same directory as this installer
#   if [[ -f "$SCRIPT_DIR/system_specs_and_llm_installer.sh" ]]; then
#       chmod +x "$SCRIPT_DIR/system_specs_and_llm_installer.sh"
#       bash "$SCRIPT_DIR/system_specs_and_llm_installer.sh"
#   else
#       echo "LLM installer script not found. Please ensure it’s in the same directory. The given path is: $SCRIPT_DIR/system_specs_and_llm_installer.sh"
#       touch ""
#       exit 1
#   fi
# }

# # Function to install the client
# install_client() {
#   echo "Installing the AI4ALL client..."
#   # Placeholder for client installation logic
#   # Example: git clone https://github.com/your-client-repo.git
# }

# # Function to install MCPs
# install_mcps() {
#   echo "Installing default MCPs..."
#   # Placeholder for MCP installation logic
#   # Example: Install filesystem mapping, PowerPoint, Excel, etc.
# }

# # Main installation steps
# install_python
# install_node
# install_git
# install_llm
# install_client
# install_mcps

# echo "AI4ALL installation complete!"


# =============================
# AI4ALL Installer Script
# =============================

# Set the PATH for Homebrew
if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
elif [ -d "/usr/local/bin" ]; then
    export PATH="/usr/local/bin:$PATH"
fi

# # Set log file
# LOGFILE="/tmp/ai4all_installer.log"
# exec > $LOGFILE 2>&1


echo "[INFO] Installation started at $(date)"

# =============================
# Install Homebrew if Missing
# =============================
if ! command -v brew &> /dev/null; then
    echo "[INFO] Homebrew not found. Installing Homebrew..."
    if [[ "$(uname -m)" == "arm64" ]]; then
        echo "[INFO] Detected Apple Silicon (M1/M2)"
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo "[INFO] Detected Intel Mac"
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.bash_profile"
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    echo "[INFO] Homebrew installed successfully."
else
    echo "[INFO] Homebrew already installed."
fi

# =============================
# Verify Network Connection
# =============================
if ! ping -c 1 google.com &> /dev/null; then
    echo "Network connection required for installation."
    exit 1
fi

# =============================
# Detect the Original User
# =============================
ORIGINAL_USER=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ { print $3 }')
USER_UID=$(id -u "$ORIGINAL_USER")

if [ -z "$ORIGINAL_USER" ] || [ "$ORIGINAL_USER" == "loginwindow" ]; then
    echo "[ERROR] Could not detect the original user. Exiting."
    exit 1
fi

echo "[INFO] Detected original user: $ORIGINAL_USER"

# =============================
# Install Required Packages
# =============================
install_brew_package() {
    local package=$1
    echo "[INFO] Installing $package as $ORIGINAL_USER..."
    launchctl asuser "$USER_UID" sudo -u "$ORIGINAL_USER" /bin/bash -c "brew install $package" || {
        echo "[ERROR] Failed to install $package."
        exit 1
    }
    echo "[INFO] $package installed successfully."
}

brew install python || { echo "[ERROR] Python installation failed"; exit 1; }
brew install node || { echo "[ERROR] Node.js installation failed"; exit 1; }
brew install git || { echo "[ERROR] Git installation failed"; exit 1; }

echo "[INFO] All packages (dependencies) installed successfully."

# =============================
# Run Sub-Installer Script
# =============================
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [[ -f "$SCRIPT_DIR/system_specs_and_llm_installer.sh" ]]; then
    chmod +x "$SCRIPT_DIR/system_specs_and_llm_installer.sh"
    bash "$SCRIPT_DIR/system_specs_and_llm_installer.sh" || {
        echo "[ERROR] LLM installer script failed."
        exit 1
    }
else
    echo "[ERROR] LLM installer script not found."
    exit 1
fi

echo "[INFO] Installation completed successfully at $(date)"
