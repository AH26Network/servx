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
HOSTNAME=$(hostname)
IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# - Welcome msg - 
echo -e "${GREEN}#######################################"
echo "Welcome on Servx Automated Installation"
echo "Warning : This script is developed for Debian 8 x64"
echo "#######################################"
echo -e "${NC}OS Detected : $OS  $VER  $ARCH"
echo "Current date : $DATE"
echo "Your IP is $IP and your hostname is $HOSTNAME"
echo ""
sleep 1

# - Select Game - 
echo -e "${GREEN}Current games supported by Servx :"
echo "Minecraft, Gmod, Rust, Don't Starve Together"
echo -e "${NC} "
sleep 1
echo "Enter the full name of the game to install without uppercase and spaces : "
read GAMETOINSTALL
echo -e "${GREEN}$GAMETOINSTALL selected !${NC}"
echo "Enter number of the server installation (shouldn't be used by another install)"
read SRVID
echo -e "${GREEN}$GAMETOINSTALL number $SRVID selected !${NC}"
echo ""

# - Updatating dedicated server - 
echo "Updating your dedicated server"
apt-get update
sleep 1
apt-get upgrade -y
sleep 1
apt-get install screen -y

# - Install - 
# - Minecraft - 
if [[ "$GAMETOINSTALL" = "minecraft" ]] ; then
apt-get install openjdk-7-jre -y
echo "Version of Minecraft ? (0 = latest)"
read MCVS
    if [[ "$MCVS" == "0" ]]; then
        echo "Installing Minecraft Server latest version"
        #install step
    elif [[ "$MCVS" == "1.7.10" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        #install step
    else
        echo "No version found"
        exit
    fi
fi
echo Done !
