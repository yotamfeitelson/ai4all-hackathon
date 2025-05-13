# AI4ALL Project

## Overview
AI4ALL is a project designed to empower non-technical users with AI tools through a simple and user-friendly interface. The project includes an installer, a client, and a marketplace for MCPs (Model Context Protocols).

---

## Components

### 1. Installer
- A cross-platform installer for Windows and Mac.
- Features:
  - User-friendly UI.
  - Installs dependencies, LLMs, clients, and MCPs.
  - Advanced options for API key integration.

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
