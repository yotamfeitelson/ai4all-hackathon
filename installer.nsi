; AI4ALL Installer Script for NSIS
; This script creates a standalone installer for Windows

!define PRODUCT_NAME "AI4ALL"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "AI4ALL Team"
!define PRODUCT_DIR_REGKEY "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\${PRODUCT_NAME}"
!define PRODUCT_UNINST_KEY "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor /SOLID lzma

OutFile "AI4ALL_Installer.exe"
InstallDir "$PROGRAMFILES\\${PRODUCT_NAME}"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" "InstallLocation"

Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

Section "Install"
  SetOutPath "$INSTDIR"
  File /r "installer_script.sh"
  File /r "installer_ui.html"
  File /r "backend_server.py"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "InstallLocation" "$INSTDIR"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "Publisher" "${PRODUCT_PUBLISHER}"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "UninstallString" "$INSTDIR\\uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete "$INSTDIR\\installer_script.sh"
  Delete "$INSTDIR\\installer_ui.html"
  Delete "$INSTDIR\\backend_server.py"
  DeleteRegKey HKLM "${PRODUCT_UNINST_ROOT_KEY}\\${PRODUCT_UNINST_KEY}"
  RMDir "$INSTDIR"
SectionEnd
