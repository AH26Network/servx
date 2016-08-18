#!/usr/bin/env bash
# Servx Automated Installation Script
# =============================================
#
#  This program is free software developed by Edouard CONNOR & Phenix for AH26
#

SERVX_VERSION="1.0.0"
SERVX_VERSION_DATE="18-Aug-16"
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
dpkg --add-architecture i386
apt-get update
sleep 1
apt-get upgrade -y
sleep 1
apt-get install screen sshpass -y
apt-get install ia32-libs -y
apt-get install ia32-libs-gtk -y
apt-get install lib32gcc1 -y
apt-get install net-tools -y
apt-get install lib32stdc++6 -y
apt-get install lib32z1 -y
apt-get install lib32z1-dev -y

# - Create User - 
if [ $(id -u) -eq 0 ]; then
	#read -p "Enter username : " username
	#$username = "$GAMETOINSTALL_$SRVID"
	echo "$GAMETOINSTALL-$SRVID"
	read  -p "Enter password for $GAMETOINSTALL Server $SRVID : " password
	egrep "^$GAMETOINSTALL-$SRVID" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$GAMETOINSTALL-$SRVID exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p $pass $GAMETOINSTALL-$SRVID
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system"
	exit 2
fi

# - Install - 
# - Minecraft - 
if [[ "$GAMETOINSTALL" = "minecraft" ]] ; then
apt-get install openjdk-7-jre -y
echo "Version of Minecraft ? (0 = latest)"
read MCVS
    if [[ "$MCVS" == "0" ]]; then
        echo "Installing Minecraft Server latest version"
        #install step
        $STATUS = OK
    elif [[ "$MCVS" == "1.7.10" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/spigot1.7.10.jar http://www.thetueurcity.com/download/spigot1.7.10.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/spigot1.7.10.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 spigot1.7.10.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else
        echo "No version found"
        exit
    fi
fi

# - GMOD - 
if [[ "$GAMETOINSTALL" = "gmod" ]] ; then
echo "Downloading SteamCMD ..."
wget -O /home/$GAMETOINSTALL-$SRVID/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
cd /home/$GAMETOINSTAL-$SRVID/
tar -xvzf steamcmd_linux.tar.gz
echo "Steam Downloading success"
chmod +x /home/$GAMETOINSTAL-$SRVID/steamcmd.sh
chmod -R 777 /home/$GAMETOINSTAL-$SRVID/
echo "Downloading Gmod"
./steamcmd.sh +login anonymous +app_update 4020 validate +quit
echo "Gmod Downloading success"
read -p "Number of Slots ?" GMOD_SLOTS
echo -e "${GREEN}Game Mode suported"
echo -e "Sandbox;DarkRP;Muder;PropHunt;JailBreak${NC}"
read -p "What Game Mode" GMOD_GAMEMODE
if [[ "$GMOD_GAMEMODE" == "darkrp" ]] ; then
echo "Downloading DarkRP ..."
wget -O /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/darkrp.zip https://github.com/FPtje/DarkRP/archive/master.zip
cd /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/
unzip master.zip
echo "DarkRP Downloading success"
fi
if [[ "$GMOD_GAMEMODE" == "prophunt" ]] ; then
echo "Downloading PropHunt ..."
wget -O /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/prop_hunt.zip http://uk2.strategyinformer.com/v2/download/fcdef8af/garrysmod/prop_hunt.zip
cd /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/
unzip prop_hunt.zip
echo "PropHunt Downloading Success"
fi
if [[ "$GMOD_GAMEMODE" == "murder" ]] ; then
echo "Downloading Murder ..."
wget -O /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/murder.zip https://github.com/mechanicalmind/murder/archive/master.zip
cd /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/
unzip master.zip
echo "Murder Downloading Success"  
fi
echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID ./srcds_run -game garrysmod +maxplayers $GMOD_SLOTS +map gm_construct +gamemode $GMOD_GAMEMODE >> cd /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/start.sh
fi

# - RUST - 
if [[ "$GAMETOINSTALL" = "rust" ]] ; then
echo "Downloading SteamCMD ..."
wget -O /home/$GAMETOINSTALL-$SRVID/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
cd /home/$GAMETOINSTALL-$SRVID/
tar -xzf steamcmd_linux.tar.gz
echo "Downloading SteamCMD Success"
chmod +x steamcmd.sh
chmod -R 777 /home/$GAMETOINSTALL-$SRVID/
#./steamcmd.sh +login anonymous +app_update 258550 validate +quit
sshpass -p '$password' ssh $GAMETOINSTALL-$SRVID@localhost ./steamcmd.sh +login anonymous +app_update 258550 validate +quit
cd /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/
fi

# - Dontstrave


# - DONE - 
echo Done !
