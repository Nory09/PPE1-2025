#!/usr/bin/bash
cat ../../../Exercices/Exercice1/ann/$1/* | grep $2 | wc -l
