if [[ "$GAMETOINSTALL" = "gmod" ]] ; then
echo "Downloading SteamCMD ..."
wget -O /home/$GAMETOINSTAL-$SRVID/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
cd /home/$GAMETOINSTAL-$SRVID/
tar -xvzf steamcmd_linux.tar.gz
echo "Steam Downloading sucess"
chmod +x Steamcmd.sh
./steamcmd.sh

fi
