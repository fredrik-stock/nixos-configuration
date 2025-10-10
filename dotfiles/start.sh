#!/usr/bin/env bash

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

systemctl --user start hyprpolkitagent 

swww init &

# swww img ~some path here &

nm-applet --indicator &

waybar &

mako