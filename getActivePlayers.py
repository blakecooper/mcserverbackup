import json
import requests

playersonline = -1;

r = requests.get("https://api.mcsrvstat.us/2/72.75.255.236:25565")

json = r.json()

playersonline = json.get("players").get("online")

print(playersonline)
