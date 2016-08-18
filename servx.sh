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

RED='\033[0;31m'
NC='\033[0m' # No Color

# - Welcome msg - 
echo -e "${RED}#######################################"
echo "Welcome on Servx Automated Installation"
echo "Warning : This script is developed for Debian 8 x64"
echo -e "${RED}#######################################"
echo "OS Detected : $OS  $VER  $ARCH"
echo "Current date : $DATE"
echo ""
echo "Current games supported by Servx :"
echo "Gmod, Rust, Minecraft, Don't starve together, Unturned"
echo ""
sleep 1
echo "Enter the full name of the game to install without uppercase : "
read GAMETOINSTALL
echo "$GAMETOINSTALL selected !"
