#!/bin/sh

pkill -f "^waybar"

waybar -c ~/.config/waybar/config.jsonc &
