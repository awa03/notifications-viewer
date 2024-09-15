#!/bin/bash

# Fetch notifications and their IDs
notifications=$(dunstctl history | jq -r '.data[].[].body.data // empty | select(length > 0)')
ids=$(dunstctl history | jq -r '.data[].[].id.data')

# Combine notifications with their corresponding IDs
menu_items=""
index=0
while IFS= read -r notif && IFS= read -r id <&3; do
    menu_items+="$notif : $id\n"
    ((index++))
done < <(echo "$notifications") 3< <(echo "$ids")


selected=$(echo -e "$menu_items" | rofi -dmenu -p "Select an option:")

if [[ $selected == *:* ]]; then
    id=$(echo "$selected" | awk -F':' '{print $2}')
    dunstctl history-rm "$id"
fi
