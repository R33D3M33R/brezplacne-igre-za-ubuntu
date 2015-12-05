#!/bin/bash
#Author: Andrej Mernik, 2015, http://andrej.mernik.eu/brezplacne-igre-za-ubuntu/
#License: GPLv3

dimenzije="800x600" # sirina x visina obrezane slike
izhodna_mapa="obrezano" # podmapa, v katero bodo shranjene obrezane slike

type convert >/dev/null 2>&1 || { echo >&2 "Program imagemagick je zahtevan in ni namescen!"; exit 1; }
if [ ! -d "$izhodna_mapa" ]; then
    echo "Ustvarjanje izhodne mape $izhodna_mapa ..."
    mkdir "$izhodna_mapa"
fi
if [[ "$#" -eq 1 && "$1" =~ ^[0-9]+[xX][0-9]+$ ]]; then
    dimenzije="$1"
fi

echo "Rezanje zaslonskih slik ..."
for slika in *.png; do
     convert $slika -crop "$dimenzije"+0+0 +repage "$izhodna_mapa/$slika"
done