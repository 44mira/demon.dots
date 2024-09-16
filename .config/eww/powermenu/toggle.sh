#!/usr/bin/env bash

# if open, then close
if eww active-windows | rg -q 'powermenu'; then
  eww close powermenu
else
  eww open powermenu
fi
