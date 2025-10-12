#!/usr/bin/bash
#Les chemins dans les commandes correspondent à mon arborescence
entite=$1


if [ -n $1 ]
then
    cat ../../../Exercices/Exercice1/ann/2016/* | grep $1 | wc -l
else
       echo "Argument incorrect"
fi
if [ -n $1 ]
then
    cat ../../../Exercices/Exercice1/ann/2017/* | grep $1 | wc -l
else
        echo "Argument incorrect"
fi
if [ -n $1 ]
then
    cat ../../../Exercices/Exercice1/ann/2018/* | grep $1 | wc -l
else
        echo "Argument incorrect"
fi




