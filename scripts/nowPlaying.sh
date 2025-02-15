#!/bin/sh

Status=$(playerctl status)
Title=$(playerctl metadata --format '{{title}}' | sed -E 's/^(.{40}).*$/\1.../' 2>/dev/null)
Artist=$(playerctl metadata --format '{{artist}}' | sed -E 's/^(.{40}).*$/\1.../' 2>/dev/null)
windowTitle () {
  VAR=$(hyprctl activewindow -j)
  echo $VAR | grep -oP '"title":\s*"\K[^"]+' | sed -E 's/^(.{40}).*$/\1.../' || echo "~"
}
[[ $Status == *"Playing"* ]] && echo "Now Playing: $Artist - $Title" || exit
