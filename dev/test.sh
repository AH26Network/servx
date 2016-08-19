#/bin/sh
GAMETOINSTALL="rust"
SRVID="1"
password="1234"
echo sshpass -p '$password' ssh $GAMETOINSTALL-$SRVID@localhost mkdir test
sleep 1
sshpass -p $password ssh $GAMETOINSTALL-$SRVID@localhost 'mkdir test'
