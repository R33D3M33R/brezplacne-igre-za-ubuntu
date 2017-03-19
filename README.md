# brezplacne-igre-za-ubuntu
Skripte za obdelavo seznama brezplačnih iger za (K)Ubuntu
https://andrej.mernik.eu/igre/brezplacne-igre-za-ubuntu/

# zajem-zaslona.sh
Skripta za zajem zaslona, ki uporablja program scrot. Možnosti -p in -z sta izbirni.

## Uporaba:

```bash
bash zajem-zaslona.sh -p igra -z zakasnitev
```

# obrezi-posnetke.sh
Skripta za obrezavo zajetih slik, ki uporablja program imagemagick

## Uporaba:

```bash
bash obrezi-posnetke.sh 640x480
```
640x480 je niz, ki določa dimenzije obrezanega posnetka (širina x višina v slikovnih točkah)

# primerjaj-razlicice.sh
Skripta, ki preveri, kateri paketi so dobili novo različico

## Uporaba:

```bash
bash primerjaj-razlicice.sh
```
