#!/bin/bash
#Author: Andrej Mernik, 2015-2017, https://andrej.mernik.eu/brezplacne-igre-za-ubuntu/
#License: GPLv3

i=0
zakasnitev=30 # koliko sekund naj mine med posnetki
posnetek="posnetek" # privzeto ime za posnetek
mapa="zajem" # privzeta mapa za zajem, "." za trenutno mapo

type scrot >/dev/null 2>&1 || { echo >&2 "Program scrot je zahtevan in ni namescen!"; exit 1; }

while getopts ":p:z:" moznost; do
  case $moznost in
    p) posnetek="$OPTARG"
    ;;
    z) zakasnitev="$OPTARG"
    ;;
    \?)
    echo "Neveljavna moznost: -$OPTARG (veljavni moznosti sta -p in -z). Uporabljanje privzetih nastavitev ..." >&2
    ;;
  esac
done

echo "Zajemanje zaslonskih slik ..."
while [ $i -lt 240 ]
do
  let "i++"
  ime="$posnetek$(date +"_%H%M_")$i".png
  scrot -z -d $zakasnitev "$mapa/$ime"
  echo "Zajet posnetek $ime"
done
