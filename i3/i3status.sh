#!/usr/bin/env bash

i3status | while :
do
  read line
  pomodoro=`i3-gnome-pomodoro status`
  echo "$pomodoro| $line" || exit 1
done

