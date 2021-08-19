#!/bin/sh
TITLE=$(playerctl -p spotify -s metadata title)
ARTIST=$(playerctl -p spotify -s metadata artist)
if [[ $TITLE != "" ]]
then
  if [[ $ARTIST != "" ]]
  then
    echo -n "${ARTIST}: "
  fi
  echo -n $TITLE
fi
