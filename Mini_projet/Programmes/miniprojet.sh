#!/usr/bin/bash
FICHIER_URLS=$1
if [ $# -ne 1 ]
then
	echo "Ce script demande 1 (et un seul) argument"
fi
NB_LIGNES=1
echo -e "Ligne\tAdresse\tRéponse\tEncodage\tNombre de Mots" >> "./Tableaux/tableau-fr.tsv"
while read -r line;
do
	CODE_HTTP=$(curl -i -L ${line} | grep "HTTP/2 "*"" | tr -d "\r\n")
	ENCODAGE=$(curl -i -L ${line} | grep "meta charset="*"")
	N_MOTS=$(lynx -dump -nolist ${line} | wc -w)
	echo -e "$NB_LIGNES\t${line}\t$CODE_HTTP\t$ENCODAGE\t$N_MOTS" >> "./Tableaux/tableau-fr.tsv";
	NB_LIGNES=$(expr $NB_LIGNES + 1);
done < "$FICHIER_URLS";
