#!/usr/bin/env bash
# Servx Automated Installation Script
# =============================================
#
#  This program is free software developed by Edouard CONNOR for AH26
#

SERVX_VERSION="1.0.0"
OS=$(uname -s)
VER=$(uname -r)
ARCH=$(uname -m)
DATE=$(date)

# - Welcome msg - 
echo "#######################################"
echo "Welcome on Servx Automated Installation"
echo "#######################################"
echo "OS Detected : $OS  $VER  $ARCH"
echo "Current date : $DATE"
echo ""
echo "Current games supported by Servx :"
echo "Gmod, Rust, Minecraft, Don't starve together, Unturned"
echo ""
pause 1
echo "Enter the full name of the game to install without uppercase : "
read GAMETOINSTALL
echo "$GAMETOINSTALL selected !"
