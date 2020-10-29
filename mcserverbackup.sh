#!/bin/bash

source secrets.sh

if [ $(python3 getActivePlayers.py $serverAddress) == "0" ] && [ $(stat -c %Y server/logs/latest.log) -gt $(stat -c %Y $pathToBackup1) ]
then 
	echo "Success!"
	zip -r $pathToBackup1 $pathToServer

	if [ $pathToBackup -ne '']
	then
		cp $pathToBackup1 $pathToBackup2 
	fi

fi
