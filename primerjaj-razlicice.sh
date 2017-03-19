#!/bin/bash
#Author: Andrej Mernik, 2016-2017, https://andrej.mernik.eu/brezplacne-igre-za-ubuntu/
#License: GPLv3

VHOD="brezplacne_igre_za_ubuntu.csv" # z vejico locen seznam: paket,razlicica
IZHOD="brezplacne_igre_za_ubuntu.razlika" 
PREZRI_VHODNI_BREZ=true # ali naj bo pomanjkanje vhodnih podatkov prezrto

type apt-cache >/dev/null 2>&1 || { echo >&2 "Program apt-cache je zahtevan in ni namescen!"; exit 1; }
dobi_razlicico() {
  if [ -z $1 ]; then
    echo '(brez)'
  elif [[ $1 == *"+"* ]]; then
    echo $1 | cut -d"+" -f1
  elif [[ $1 == *"-"* ]]; then
    echo $1 | cut -d"-" -f1
  else
    echo $1
  fi
}
echo "Obdelovanje seznama ..."
> $IZHOD
while read -r vrstica
do
  polje=(${vrstica//,/ })
  paket=${polje[0]}
  razlicica=$(dobi_razlicico "${polje[1]}")
  razlicica_skladisce=$(dobi_razlicico "$(dobi_razlicico "$(apt-cache policy $paket | grep Kandidat: | cut -d" " -f4)")")
  if [[ "$razlicica_skladisce" != "$razlicica" && ("$PREZRI_VHODNI_BREZ" == false || ("$PREZRI_VHODNI_BREZ" == true && "$razlicica" != "(brez)")) ]]; then
    echo "$paket opisana: $razlicica skladisce: $razlicica_skladisce" >> $IZHOD
  fi
done < "$VHOD"
echo "Konec obdelovanja seznama  ..."
