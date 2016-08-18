if [[ "$GAMETOINSTALL" = "gmod" ]] ; then
echo "Downloading SteamCMD ..."
    wget -O /home/$GAMETOINSTAL-$SRVID/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
    cd /home/$GAMETOINSTAL-$SRVID/
    tar -xvzf steamcmd_linux.tar.gz
echo "Steam Downloading success"
    chmod +x steamcmd.sh
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
  unzip master.zip
echo "DarkRP Downloading success"
  fi
  if [[ "$GMOD_GAMEMODE" == "PropHunt" ]] ; then
echo "Downloading PropHunt ..."
  wget -O /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/prop_hunt.zip http://uk2.strategyinformer.com/v2/download/fcdef8af/garrysmod/prop_hunt.zip
  unzip prop_hunt.zip
echo "PropHunt Downloading Success"
   fi
  if [[ "$GMOD_GAMEMODE" == "Murder" ]] ; then
echo "Downloading Murder ..."
  wget -O /home/$GAMETOINSTAL-$SRVID/Steam/steamapps/common/GarrysModDS/garrysmod/gamemodes/murder.zip https://github.com/mechanicalmind/murder/archive/master.zip
  unzip master.zip
echo "Murder Downloading Success"  
  fi
 fi
