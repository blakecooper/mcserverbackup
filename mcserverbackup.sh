#!/bin/bash

./secrets.sh

if [ $(python3 getActivePlayers.py $serverAddress) == "0" ] && [ $(stat -c %Y ${pathToServer}/logs/latest.log) -gt $(stat -c %Y $pathToBackup1) ]
then
	zip -r $pathToBackup1 $pathToServer
	cp $pathToBackup1 $pathToBackup2 
fi
