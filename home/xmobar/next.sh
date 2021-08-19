#!/bin/sh
STATUS=$(playerctl -p spotify -s status)

# No options if no music is playing
if [[ $STATUS != "" ]]
then
  echo -n "[ next ]"
fi