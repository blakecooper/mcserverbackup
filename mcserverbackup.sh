#!/bin/bash

if [ $(python3 getActivePlayers.py) == "0" ]
then
	if [ $(stat -c %Y MinecraftServer/logs/latest.log) -gt $(stat -c %Y MinecraftServer_backsups/minecraftserver_backup.zip) ]
		zip -r MinecraftServer_backups/minecraftserver_backup.zip MinecraftServer
		cp MinecraftServer_backups/minecraftserver_backup.zip /media/blake-and-dave/MCS_backup
	fi
fi
