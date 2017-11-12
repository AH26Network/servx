#!/usr/bin/env bash
# Servx Automated Installation Script
# =============================================
#
#  This program is free software developed by Edouard CONNOR & Phenix for AH26
#
#  GAMES : Rust:ERR Terraria:ok Gmod:ok Minecraft:ok DonotStarveTogether:ERR(Token not found)

SERVX_VERSION="1.1.0"
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

# - Select Game - 
echo -e "${GREEN}Current games supported by Servx :"
echo "Minecraft, Gmod, Dontstarve (80% working), Terraria (1321)"
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
apt-get install screen sshpass proftpd sudo -y
apt-get install ia32-libs -y
apt-get install ia32-libs-gtk -y
apt-get install lib32gcc1 -y
apt-get install net-tools -y
apt-get install lib32stdc++6 -y
apt-get install lib32z1 -y
apt-get install lib32z1-dev -y
apt-get install libgcc1 -y
apt-get install libcurl4-gnutls-dev:i386 -y

wget -q -O /etc/proftpd/proftpd.conf https://raw.githubusercontent.com/AH26Network/servx/master/dl/proftpd.conf

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
echo "Version of Minecraft ?"
read MCVS
    if [[ "$MCVS" == "0" ]]; then
        echo "Installing Minecraft Server latest version"
        #install step
        $STATUS = OK
    elif [[ "$MCVS" == "1.10.2" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.10.2-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.10.2-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.10.2-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.10.2-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
     elif [[ "$MCVS" == "1.10" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.10-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.10-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.10-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.10-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.9.4" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/spigot-1.9.4-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/spigot-1.9.4-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/spigot-1.9.4-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 spigot-1.9.4-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.9.2" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 spigot-1.9.2-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.9" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 spigot-1.9.2-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.8.8" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.8-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.8-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.8-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.8-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.8.7" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.7-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.7-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.7-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.7-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.8.6" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.6-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.6-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.6-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.6-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.8.5" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.5-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.5-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.5-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.5-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.8.4" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.4-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.4-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.4-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.4-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.8.3" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.3-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.3-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.3-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.3-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.8" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.2-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.7.10" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.10-R0.2-SNAPSHOT.jar https://www.getbukkit.org/files/craftbukkit-1.7.10-R0.2-SNAPSHOT.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.10-R0.2-SNAPSHOT.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.7.10-R0.2-SNAPSHOT.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.7.9" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.9-R0.2-SNAPSHOT.jar https://www.getbukkit.org/files/craftbukkit-1.7.9-R0.2-SNAPSHOT.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.9-R0.2-SNAPSHOT.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.7.9-R0.2-SNAPSHOT.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.7.8" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.8-R0.2-SNAPSHOT.jar https://www.getbukkit.org/files/craftbukkit-1.7.8-R0.2-SNAPSHOT.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.8-R0.2-SNAPSHOT.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.7.8-R0.2-SNAPSHOT.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.7.5" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkitt in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.5-R0.2-SNAPSHOT.jar https://www.getbukkit.org/files/craftbukkit-1.7.5-R0.2-SNAPSHOT.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.5-R0.2-SNAPSHOT.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.7.5-R0.2-SNAPSHOT.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.7.2" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.2-R0.2-SNAPSHOT.jar https://www.getbukkit.org/files/craftbukkit-1.7.2-R0.2-SNAPSHOT.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.7.2-R0.2-SNAPSHOT.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.7.2-R0.2-SNAPSHOT.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    elif [[ "$MCVS" == "1.6.4" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Craftbukkit in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.6.4-R2.0.jar https://www.getbukkit.org/files/craftbukkit-1.6.4-R2.0.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.6.4-R2.0.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.6.4-R2.0.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh	
    else    
        echo "No version found"
        exit
    fi
    wget -O /home/$GAMETOINSTALL-$SRVID/eula.txt https://raw.githubusercontent.com/AH26Network/servx/master/dl/minecraft_eula.txt
fi

# - GMOD - 
if [[ "$GAMETOINSTALL" = "gmod" ]] ; then
echo "Downloading SteamCMD ..."
wget -O /home/$GAMETOINSTALL-$SRVID/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
cd /home/$GAMETOINSTALL-$SRVID/
tar -xvzf steamcmd_linux.tar.gz
echo "Steam Downloading success"
chmod +x /home/$GAMETOINSTALL-$SRVID/steamcmd.sh
chmod -R 777 /home/$GAMETOINSTALL-$SRVID/
echo "Downloading Gmod"
sudo -u $GAMETOINSTALL-$SRVID ./steamcmd.sh +login anonymous +app_update 4020 validate +quit
echo "Gmod Downloading success"
read -p "Number of Slots ?" GMOD_SLOTS
echo -e "${GREEN}Game Mode suported"
echo -e "Sandbox; DarkRP; Muder; PropHunt; JailBreak${NC}"
echo "What Game Mode" 
read GMOD_GAMEMODE
if [[ "$GMOD_GAMEMODE" == "darkrp" ]] ; then
echo "Downloading DarkRP ..."
wget -O /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/darkrp.zip https://github.com/FPtje/DarkRP/archive/master.zip
cd /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/
unzip darkrp.zip
echo "DarkRP Downloading success"
fi
if [[ "$GMOD_GAMEMODE" == "prophunt" ]] ; then
echo "Downloading PropHunt ..."
wget -O /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/prop_hunt.zip http://uk2.strategyinformer.com/v2/download/fcdef8af/garrysmod/prop_hunt.zip
cd /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/
unzip prop_hunt.zip
echo "PropHunt Downloading Success"
fi
if [[ "$GMOD_GAMEMODE" == "murder" ]] ; then
echo "Downloading Murder ..."
wget -O /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/murder.zip https://github.com/mechanicalmind/murder/archive/master.zip
cd /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/
unzip murder.zip
echo "Murder Downloading Success"  
fi
echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID ./srcds_run -game garrysmod +maxplayers $GMOD_SLOTS +map gm_construct +gamemode $GMOD_GAMEMODE >> /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/GarrysModDS/start.sh
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
sudo -u $GAMETOINSTALL-$SRVID ./steamcmd.sh +login anonymous +app_update 258550 validate +quit
./steamcmd.sh +login anonymous +app_update 258550 validate +quit
sshpass -p $password ssh $GAMETOINSTALL-$SRVID@localhost './steamcmd.sh +login anonymous +app_update 258550 validate +quit'
read  -p "Enter $GAMETOINSTALL Server name : " RUST_NAME
read  -p "Enter $GAMETOINSTALL Server Slots : " RUST_SLOT
read  -p "Enter $GAMETOINSTALL Server Rcon Password : " RUST_RCPASSWD
cd /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/rust_dedicated/
echo "screen -h 1024 -dmS $GAMETOINSTALL-$SRVID ./RustDedicated -batchmode +server.ip $IP +server.port 28015 +server.tickrate 30 +server.hostname "$RUST_NAME" +server.identity "$RUST_NAME" +server.maxplayers $RUST_SLOT +server.worldsize 4000 +server.saveinterval 600 +rcon.ip 0.0.0.0 +rcon.port 28016 +rcon.password "$RUST_RCPASSWD"" >> /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/rust_dedicated/start.sh
fi

# - Terraria -
if [[ "$GAMETOINSTALL" = "terraria" ]] ; then
echo Installing Mono ...
apt-get install mono-complete -y
echo Downloading Terraria Server ...
cd /home/$GAMETOINSTALL-$SRVID/
wget http://terraria.org/server/terraria-server-1353.zip
sudo -u $GAMETOINSTALL-$SRVID unzip terraria-server-1353.zip
cd /home/$GAMETOINSTALL-$SRVID/1353/Linux/
echo "screen -h 1024 -dmS $GAMETOINSTALL-$SRVID mono --server --gc=sgen -O=all TerrariaServer.exe" >> /home/$GAMETOINSTALL-$SRVID/Linux/start.sh
chmod +x start.sh
fi

# - Dontstarve
if [[ "$GAMETOINSTALL" = "dontstarve" ]] ; then
echo "Downloading SteamCMD ..."
wget -O /home/$GAMETOINSTALL-$SRVID/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
cd /home/$GAMETOINSTALL-$SRVID/
tar -xzf steamcmd_linux.tar.gz
echo "Downloading SteamCMD Success"
echo "Downloading Don't Starve ..."
chmod +x steamcmd.sh
chmod -R 777 /home/$GAMETOINSTALL-$SRVID/
sudo -u $GAMETOINSTALL-$SRVID ./steamcmd.sh +login anonymous +app_update 343050 validate +quit
echo "DonotStrave Downloading success"
cd /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/Don\'t\ Starve\ Together\ Dedicated\ Server/bin/
echo "screen -h 1024 -dmS $GAMETOINSTALL-$SRVID ./dontstarve_dedicated_server_nullrenderer" >> /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/Don\'t\ Starve\ Together\ Dedicated\ Server/bin/start.sh
chmod +x /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/Don\'t\ Starve\ Together\ Dedicated\ Server/bin/start.sh
mkdir /home/$GAMETOINSTALL-$SRVID/.Klei
mkdir /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether
mkdir /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1

echo "Generating Cluster Token ..."
echo 'pds-g^KU_Q2rjfXta^T/cQZDjEw0AEJKPeCiRxnDARrR+lFaacQnp1QgW+uAw=' >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster_token.txt

echo "Creating config ..."
echo "[GAMEPLAY]" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
read -p "Your DST Server Gamemode : (endless | survival | wilderness) " DST_GAMEMODE
echo "game_mode = $DST_GAMEMODE" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
read -p "Your DST Server Max Players : " DST_PLAYERS
echo "max_players = $DST_PLAYERS" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
read -p "Enable PvP ? : (true | false)" DST_PVP
echo "pvp = $DST_PVP" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "pause_when_empty = true" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "[NETWORK]" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "lan_only_cluster = false" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
read -p "Your DST Server Intention : (cooperative | social | competitive | madness) " DST_INTENTION
echo "cluster_intention = $DST_INTENTION" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
read -p "Your DST Server Description : " DST_DESCRIP
echo "cluster_description = $DST_DESCRIP" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
read -p "Your DST Server Name : " DST_NAME
echo "cluster_name = $DST_NAME" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "offline_cluster = false" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
read -p "Your DST Server Password : (empty for no password) " DST_PWD
echo "cluster_password = $DST_PWD" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "[MISC]" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "console_enabled = true" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "[SHARD]" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "shard_enabled = false" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "bind_ip = 127.0.0.1" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "master_ip = 127.0.0.1" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "master_port = 10888" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini
echo "cluster_key = defaultPass" >> /home/$GAMETOINSTALL-$SRVID/.Klei/DoNotStarvetogether/Cluster_1/cluster.ini


fi

# - Install infos - 
echo "Congratulation ! Your server is fully installed." >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "You have installed $GAMETOINSTALL Server $SRVID on $HOSTNAME" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "To use your game server please run the start.sh in your server directory" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "After that, to see console run command : screen -x $GAMETOINSTALL-$SRVID" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "(to quit console without close server use ctrl+a+d and to close the server use ctrl+c)" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "To modify the server properties, you should connect by FTP on the server :" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "Protocol : FTP" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "Host : $IP" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "Username : $GAMETOINSTALL-$SRVID" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "Password : $password" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "Warning : if you delete any file on your server, you may endommaged your game server" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "---" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "Game Server Informations :" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "IP : $IP" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "Game : $GAMETOINSTALL" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "Number of server install : $SRVID" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "Thank for using Servx, Servx has been create with github.com by Edouard CONNOR and Phenix" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt
echo "More informations on Github.com : https://github.com/AH26Network/servx/" >> /home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt

echo ""
echo -e "${GREEN}Your game server was successfuly created !"
echo -e "${BLUE}Your server credentials are in ${RED}/home/$GAMETOINSTALL-$SRVID/install-$GAMETOINSTALL-$SRVID-report.txt${BLUE}."
echo -e "${NC} "


# - DONE - 
echo "Done !"
