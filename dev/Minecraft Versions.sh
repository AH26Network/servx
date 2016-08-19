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
