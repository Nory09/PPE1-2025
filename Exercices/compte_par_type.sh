#!/usr/bin/bash
#Les chemins dans les commandes correspondent à mon arborescence
annee=$1
entite=$2


if [ $annee -ge "2016" ] && [ $annee -le "2018" ] && [ -n $entite ]
then
    cat ../../../Exercices/Exercice1/ann/$1/* | grep $2 | wc -l
else
    echo "Arguments incorrects"
fi
