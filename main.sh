#!/bin/bash

# Eaglercraft Server
# Thrown together in a few days by TheCerealist
# Go love ayun, he gave me the idea.

unset DISPLAY

echo "set -g mouse on" > ~/.tmux.conf

tmux kill-session -t server
# Restart Caddyserver, portforwarding 8081 for Eaglercraft.
cd ./Caddy
caddy stop
caddy start --config ./Caddyfile > /dev/null 2>&1
cd ..
# Run Cuberite Server
cd ./Cuberite
chmod +x Cuberite
tmux new -d -s server "./Cuberite"
cd ..
# Run Waterfall/Bungeecord
cd ./Bungee
tmux splitw -t server -h "java -Xmx128M -Xms128M -jar bungee.jar; tmux kill-session -t server"
cd ..

while tmux has-session -t server
do
  tmux a -t server
done

caddy stop