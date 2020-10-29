#!/bin/bash

source secrets.sh

if [[ $(python3 $globalPath/getActivePlayers.py $serverAddress) == "0" ]]
then
	if [[ -f $pathToBackup1/minecraftserver_backup_1.zip ]]
	then
		if [[ $(stat -c %Y $pathToServer/logs/latest.log) -gt $(stat -c %Y $pathToBackup1/minecraftserver_backup_1.zip) ]]
		then
			i=$[$numberOfBackups]

			if [[ -f $pathToBackup1/minecraftserver_backup_$numberOfBackups.zip ]]
			then
				rm $pathToBackup1/minecraftserver_backup_$numberOfBackups.zip
				if [[ $pathToBackup2 != "" ]]
				then
					rm $pathToBackup2/minecraftserver_backup_$numberOfBackups.zip
				fi
				i=$[$i-1]
			fi
		
			while [[ $i -gt 0 ]]
			do
				if [[ -f $pathToBackup1/minecraftserver_backup_$i.zip ]]
				then
					mv $pathToBackup1/minecraftserver_backup_$i.zip $pathToBackup1/minecraftserver_backup_$[$i+1].zip
				fi	
				
				i=$[$i-1]
			done
		
			zip -r $pathToBackup1/minecraftserver_backup_1.zip $pathToServer
	
			if [[ $pathToBackup2 != "" ]]
			then
			
				i=$numberOfBackups
		
				while [[ $i > 0 ]]
				do
					if [[ -f $pathToBackup2/minecraftserver_backup_$i.zip ]]
					then
						mv $pathToBackup2/minecraftserver_backup_$i.zip $pathToBackup2/minecraftserver_backup_$[$i+1].zip
					fi
					i=$[$i-1] 
				done
		
				cp $pathToBackup1/minecraftserver_backup_1.zip $pathToBackup2 
			fi
		fi
	else
		zip -r $pathToBackup1/minecraftserver_backup_1.zip $pathToServer
		cp $pathToBackup1/minecraftserver_backup_1.zip $pathToBackup2 
	fi

fi
