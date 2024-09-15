#!/bin/bash


options=$(dunstctl history | jq -r '.data[].[].body.data // empty | select(length > 0)' | awk 'NF')
options_str=$(printf "%s\n" "$options")

# Add custom options
#custom_options="Open Terminal\nRestart Window Manager\nShutdown\nReboot"

# Combine notifications and custom options
menu_items=$(printf "%s\n%s" "$options_str")

# Use rofi to display the options and get the selected option
selected=$(echo -e "$menu_items" | rofi -dmenu -p "Select an option:")
