# Manual Guide for Creating a macOS Installer Using Packages

This guide provides step-by-step instructions for creating a macOS installer using the Packages application.

---

## Prerequisites
1. **Download and Install Packages**:
   - Visit [Packages](http://s.sudre.free.fr/Software/Packages/about.html) and download the application.
   - Install it on your macOS system.

2. **Prepare Files**:
   - Ensure the following files are ready in a single directory:
     - `installer_script.sh`
     - `installer_ui.html`
     - `backend_server.py`

---

## Steps to Create the Installer

### 1. Create a New Project
1. Open the Packages application.
2. Click on **File > New Project**.
3. Select **Raw Package** and click **Next**.
4. Enter the project name (e.g., `AI4ALL Installer`) and save it.

---

### 2. Configure the Project
1. **Settings**:
   - Go to the **Settings** tab.
   - Set the **Identifier** to `com.ai4all.installer`.
   - Set the **Version** to `1.0`.
   - Set the **Install Location** to `/Applications/AI4ALL`.

2. **Payload**:
   - Go to the **Payload** tab.
   - Drag and drop the prepared files (`installer_script.sh`, `installer_ui.html`, `backend_server.py`) into the payload area.
   - Ensure the files are placed in the `/Applications/AI4ALL` directory.

3. **Scripts**:
   - Go to the **Scripts** tab.
   - Add a **Post-Installation Script**:
     ```bash
     #!/bin/bash
     chmod +x /Applications/AI4ALL/installer_script.sh
     ```

---

### 3. Build the Installer
1. Click on **Build > Build** from the top menu.
2. The `.pkg` file will be generated in the output directory.

---

## Testing the Installer
1. Double-click the generated `.pkg` file to run the installer.
2. Follow the on-screen instructions to complete the installation.
3. Verify that the files are installed in `/Applications/AI4ALL` and that the `installer_script.sh` is executable.

---

## Troubleshooting
- If you encounter any issues, ensure that:
  - The file paths in the payload are correct.
  - The post-installation script has the correct permissions.

Let me know if further assistance is needed!
