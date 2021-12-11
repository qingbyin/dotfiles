#!/usr/bin/env bash

i3status | while :
do
  read line
  motto=$(head -n 1 ~/dotfiles/i3/motto.md)
  pomodoro=`i3-gnome-pomodoro status`
  echo "$pomodoro| $motto | $line" || exit 1
done

