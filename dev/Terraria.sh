if [[ "$GAMETOINSTALL" = "terraria" ]] ; then
echo "Downloading SteamCMD ..."
wget -O /home/$GAMETOINSTALL-$SRVID/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
cd /home/$GAMETOINSTALL-$SRVID/
tar -xzf steamcmd_linux.tar.gz
echo "Downloading SteamCMD Success"
chmod +x steamcmd.sh
chmod -R 777 /home/$GAMETOINSTALL-$SRVID/
sudo -u $GAMETOINSTALL-$SRVID ./steamcmd.sh +login anonymous +app_update 105600 validate +quit
echo "Terraria Downloading success"
echo "screen -h 1024 -dmS mono --server --gc=sgen -O=all TerrariaServer.exe" >> /home/$GAMETOINSTALL-$SRVID/Steam/steamapps/common/Terraria/start.sh
fi
