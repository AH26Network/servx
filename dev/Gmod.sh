if [[ "$GAMETOINSTALL" = "gmod" ]] ; then
echo "Downloading SteamCMD ..."
    wget -O /home/$GAMETOINSTAL-$SRVID/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
    cd /home/$GAMETOINSTAL-$SRVID/
    tar -xvzf steamcmd_linux.tar.gz
echo "Steam Downloading success"
    chmod +x Steamcmd.sh
echo "Downloading Gmod"
    ./steamcmd.sh +login anonymous +app_update 4020 validate +quit
echo "Gmod Downloading success"
  read -p "Number of Slots ?" GMOD_SLOTS
echo -e "${GREEN}Game Mode suported"
echo -e "Sandbox;DarkRP;Muder;PropHunt;JailBreak${NC}"
  read -p "What Game Mode" GMOD_GAMEMODE
  if [[ "$GMOD_GAMEMODE" == "darkrp" ]] ; then
  echo "Downloading DarkRP"
  wget -O /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/master.zip https://github.com/FPtje/DarkRP/archive/master.zip
  echo "DarkRP Downloading success"
  fi
  if [[ "$GMOD_GAMEMODE" == "murder" ]] ; then
  
  fi
  if [[ "$GMOD_GAMEMODE" == "Sandbox" ]] ; then
  
  fi
fi
