#!/usr/bin/env bash
# Servx Automated Installation Script
# =============================================
#
#  This program is free software : ...
#

SERVX_VERSION="1"
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
