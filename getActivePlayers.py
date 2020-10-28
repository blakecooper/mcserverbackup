import sys
import requests

playersonline = -1;

if len(sys.argv) > 1:
    requestAddress = "https://api.mcsrvstat.us/2/" + sys.argv[1]
    r = requests.get(requestAddress)
    json = r.json()
    playersonline = json.get("players").get("online")

print(playersonline)
