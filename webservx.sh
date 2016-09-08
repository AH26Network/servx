#!/usr/bin/env bash
# Web Servx Automated Installation Script
# =============================================
#
#  This program is free software developed by Edouard CONNOR & Phenix for AH26
#
# 

SERVX_VERSION="1.0.0"
SERVX_VERSION_DATE="08-Sep-16"
OS=$(uname -s)
VER=$(uname -r)
ARCH=$(uname -m)
DATE=$(date)
HOSTNAME=$(hostname)
IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
STATUS="ERROR"

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

# - Select Service - 
echo -e "${GREEN}Current web services supported by Servx :"
echo "Apache2 (1), PHP5 (2), MySQL (3), PHPmyadmin (ERR)"
echo -e "${NC} "
sleep 1
echo "Enter the number of the service to install without uppercase and spaces : "
echo "Example : To install Apache enter 1 and to install Apache + PHP enter 12"
echo "To install all service enter ALL"
read  -p "Service number(s) : " SERVTOINSTALL
echo -e "${GREEN}$SERVTOINSTALL selected !${NC}"
echo ""

# - Updatating dedicated server - 
echo "Updating your dedicated server"
apt-get update
sleep 1
apt-get upgrade -y

# - Installing Services - 

# - APACHE (1) - 
if [[ "$SERVTOINSTALL" = "1" ]] ; then
apt-get install apache2 -y
wget -q -O /var/www/html/index.html https://raw.githubusercontent.com/AH26Network/servx/master/dl/web_default.html
fi

# - PHP5 (2) - 
if [[ "$SERVTOINSTALL" = "2" ]] ; then
apt-get install php5 libapache2-mod-php5 -y
fi

# - Mysql (3) - 
if [[ "$SERVTOINSTALL" = "3" ]] ; then
apt-get install mysql-server php5-mysql -y
fi

# - 1+2 - 
if [[ "$SERVTOINSTALL" = "12" ]] ; then
apt-get install apache2 php5 libapache2-mod-php5 -y
wget -q -O /var/www/html/index.html https://raw.githubusercontent.com/AH26Network/servx/master/dl/web_default.html
fi

# - ALL - 
if [[ "$SERVTOINSTALL" = "ALL" ]] ; then
apt-get install apache2 php5 libapache2-mod-php5 mysql-server php5-mysql -y
wget -q -O /var/www/html/index.html https://raw.githubusercontent.com/AH26Network/servx/master/dl/web_default.html
fi
