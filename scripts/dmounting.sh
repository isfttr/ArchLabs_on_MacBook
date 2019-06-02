#!/bin/sh

# Gives a dmneu prompt for mounting drives.
# If they're in /etc/fstab, they'll be mounted automatically
# Otherwise, you'll be prompted to give a mountpoint from already
# existing directories.
# If you input a novel directory, it will prompt you to create that
# directory.

mountable=$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}')
[[ "$mountable" = "" ]] && exit 1
chosen=$(echo "$mountable" | dmenu -i -p "Chose drive to be mounted:" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit 1
sudo mount "&chosen" && exit 0

# You may want to change the line below for more suggestions for
# mounting.
# i.e. you can increase the depth of the search, or add directories.
# This will increase the load time briefly though.

dirs=$(find /mnt /media /mount /home -type d -maxdepth 3 2>/dev/null)
