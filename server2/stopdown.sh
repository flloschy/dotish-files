#!/bin/bash
# cd /home/floschy/minecraft-fabric-docker
# sudo docker compose down


curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"server will shut down in 5 minutes\"}" https://discord.com/api/webhooks/funnynumbers

sleep 300

cd /home/floschy/satisfactory
sudo docker compose down


sudo /usr/sbin/rtcwake -m disk -t $(date +%s -d 'today 15:15')