#!/usr/bin/bash
#Les chemins dans les commandes correspondent à mon arborescence
annee=$1
mois=$2
nombre_lignes=$3

if [[ "$annee" == "*" || ( "$annee" -ge 2016 && "$annee" -le 2018 ) ]]
then

    if  [[ "$mois" == "*" || ( "$mois" -ge 1 && "$mois" -le 12 ) ]]
    then

        if [ $nombre_lignes -gt "0" ]
        then

              cat ../../../Exercices/Exercice1/ann/$1/*_$2_* | grep Location | cut -f 3  | sort |  uniq -c | sort -n | tail -n $3

        fi
    fi
else
    exit
fi
