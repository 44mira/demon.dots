#/usr/bin/env bash

run() {
  if ! pgrep -f "$1"; then
    "$@" &
  fi
}

run picom
run nm-applet

run eww daemon
eww open taskbar


