#!/bin/bash

# cd /home/floschy/minecraft-fabric-docker
# sudo docker compose up -d

cd /home/floschy/satisfactory
sudo docker compose up -d

curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"server should be up in a few seconds\ncurrent IP is: $(curl -4 icanhazip.com)\"}" https://discord.com/api/webhooks/funnynumbers