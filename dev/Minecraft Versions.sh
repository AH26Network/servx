if [[ "$GAMETOINSTALL" = "minecraft" ]] ; then
apt-get install openjdk-7-jre -y
echo "Version of Minecraft ? (0 = latest)"
read MCVS
    if [[ "$MCVS" == "0" ]]; then
        echo "Installing Minecraft Server latest version"
        #install step
        $STATUS = OK
    elif [[ "$MCVS" == "1.10.2" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.10.2-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.10.2-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.10.2-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.10.2-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else
    elif [[ "$MCVS" == "1.10" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.10-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.10-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.10-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.10-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else
    elif [[ "$MCVS" == "1.9.4" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/spigot-1.9.4-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/spigot-1.9.4-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/spigot-1.9.4-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 spigot-1.9.4-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else    elif [[ "$MCVS" == "1.9.2" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 spigot-1.9.2-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else    elif [[ "$MCVS" == "1.9" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 spigot-1.9.2-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else    elif [[ "$MCVS" == "1.8.8" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.8-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.8-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.8-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.8-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else    elif [[ "$MCVS" == "1.8.7" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.7-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.7-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.7-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.7-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else    elif [[ "$MCVS" == "1.8.6" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.6-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.6-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.6-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.6-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else 
    else    elif [[ "$MCVS" == "1.8.5" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.5-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.5-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.5-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.5-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else
    else    elif [[ "$MCVS" == "1.8.4" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.4-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.4-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.4-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.4-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else
    else    elif [[ "$MCVS" == "1.8.3" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.3-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.3-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8.3-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8.3-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else
    else    elif [[ "$MCVS" == "1.8" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8-R0.1-SNAPSHOT-latest.jar https://www.getbukkit.org/files/craftbukkit-1.8.2-R0.1-SNAPSHOT-latest.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/craftbukkit-1.8-R0.1-SNAPSHOT-latest.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 craftbukkit-1.8-R0.1-SNAPSHOT-latest.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else     
    elif [[ "$MCVS" == "1.7.10" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/spigot1.7.10.jar http://www.thetueurcity.com/download/spigot1.7.10.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/spigot1.7.10.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 spigot1.7.10.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else
    elif [[ "$MCVS" == "1.7.9" ]]; then
        echo "Installing Minecraft Server in $MCVS"
        echo "Downloading Spigot in $MCVS"
	wget -O /home/$GAMETOINSTALL-$SRVID/spigot1.7.10.jar http://www.thetueurcity.com/download/spigot1.7.9.jar
	chmod +x /home/$GAMETOINSTALL-$SRVID/spigot1.7.10.jar
	echo screen -h 1024 -dmS $GAMETOINSTALL-$SRVID java -Xms512M -Xmx1024M -jar -XX:ParallelGCThreads=1 spigot1.7.10.jar >> /home/$GAMETOINSTALL-$SRVID/start.sh
	chmod +x /home/$GAMETOINSTALL-$SRVID/start.sh
    else    
        echo "No version found"
        exit
    fi
fi
