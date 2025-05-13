# AI4ALL Project

## Overview
AI4ALL is a project designed to empower non-technical users with AI tools through a simple and user-friendly interface. The project includes an installer, a client, and a marketplace for MCPs (Model Context Protocols).

---

## Components

### 1. Installer
- A cross-platform installer for Windows and Mac.
- Features:
  - User-friendly UI. - Done ✅
  - Installs dependencies, LLMs, clients, and MCPs. - Partially done, WIP for LLM, client, MCPs 👷🏼‍♀️
  - Advanced options for API key integration.
TODO:
- installer.nsi: 
        A standalone installer script for Windows has been created using NSIS. Here's what has been added:

        1. __installer.nsi__: An NSIS script to generate a Windows installer (`AI4ALL_Installer.exe`). The installer:

        - Installs the necessary files (`installer_script.sh`, `installer_ui.html`, `backend_server.py`) to the target directory.
        - Creates registry entries for easy uninstallation.
        - Includes an uninstallation section to clean up installed files and registry keys.

        ### How to Use:

        1. __Install NSIS__:

        - Download and install NSIS from [nsis.sourceforge.io](https://nsis.sourceforge.io/).

        2. __Generate the Installer__:

        - Open the NSIS application.
        - Load the `installer.nsi` script.
        - Compile the script to generate `AI4ALL_Installer.exe`.

        3. __Run the Installer__:

        - Double-click the generated `AI4ALL_Installer.exe` to install the application.
        - Follow the on-screen instructions to complete the installation.


### 2. LLM Integration
- Detect system specs and install the appropriate LLM (e.g., BitNet, llama.cpp, ollama, etc.).
- Ensure LLM compatibility with MCP.

### 3. Client
- A chatbot interface with various tools.
- Options:
  - Build a custom client.
  - Fork an existing client (e.g., DEER).
- Includes a UI for the MCP marketplace.

### 4. MCPs
- Default MCPs:
  - Filesystem mapping.
  - PowerPoint, Excel, Mail, Calendar.
  - Funny GIFs Generator (can be downloaded from the marketplace)
- Installation scripts for MCPs (and dependencies).
- Integration into the installer and marketplace.

### 5. Marketplace
- A marketplace for MCPs with easy installation.
- Linked to the client via a dedicated button.

---

## Tasks and Difficulty Levels

### Easy (1)
- Create a repository with detailed documentation.

### Medium (2-2.5)
- Detect system specs and recommend/install LLMs.
- Add API key integration to the installer.
- Install Python/Node if missing.

### Hard (3)
- Fork DEER or another client and integrate the LLM.
- Add a marketplace UI to the client.
- Identify and script MCP installations.

---

## Open Questions
1. Which LLM should we prioritize (BitNet, llama.cpp, or others)?
2. Should we build a custom client or fork an existing one?
3. Which MCPs should be included by default?
4. Should the marketplace be standalone or integrated into the client?
5. Preferred framework for the installer UI?

---

## Getting Started
1. Clone the repository.
2. Follow the instructions in the installer to set up the environment.
3. Explore the client and marketplace for MCPs.

---

## Contributing
Contributions are welcome! Please refer to the `CONTRIBUTING.md` for guidelines.

---

## License
This project is licensed under the MIT License.
