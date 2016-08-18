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
fi
