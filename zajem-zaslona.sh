#!/bin/bash
i=0
zakasnitev=30 # koliko sekund naj mine med posnetki
posnetek="posnetek" # privzeto ime za posnetek

type scrot >/dev/null 2>&1 || { echo >&2 "Program scrot je zahtevan in ni namescen!"; exit 1; }

if [ $# -eq 1 ]; then
    posnetek="$1"
fi
echo "Zajemanje zaslonskih slik ..."
while [ $i -lt 240 ]
do
  let "i++"
  ime="$posnetek$(date +"_%H%M_")$i".png
  scrot -d $zakasnitev $ime
  echo "Zajet posnetek $ime"
done