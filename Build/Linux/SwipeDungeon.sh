#!/bin/sh
printf '\033c\033]0;%s\a' Swipe Dungeon
base_path="$(dirname "$(realpath "$0")")"
"$base_path/SwipeDungeon.x86_64" "$@"
