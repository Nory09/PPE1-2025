#!/usr/bin/bash
FICHIER_URLS=$1
FICHIER_SORTIE=$2
if [ $# -ne 2 ]
then
	echo "Ce script demande 2 arguments : Le chemin du fichier d'urls et le chemin du fichier de sortie"
fi
NB_LIGNES=1
echo -e "<head>Tableau PPE</head>\n
<body>\n
\t\<table>\n
\t\t<tr><th>Ligne</th><th>Adresse</th><th>Réponse</th><th>Encodage</th><th>Nombre de Mots</th></tr>\n" >> "$FICHIER_SORTIE"
while read -r line;
do
	CODE_HTTP=$(curl -i -L ${line} | grep "HTTP/2 "*"" | tr -d "\r\n")
	ENCODAGE=$(curl -i -L ${line} | grep "charset="*"")
	N_MOTS=$(lynx -dump -nolist ${line} | wc -w)
	echo -e "\t\t<tr><td>$NB_LIGNES</td><td>${line}</td><td>$CODE_HTTP</td><td>$ENCODAGE</td><td>$N_MOTS</td></tr>" >> "$FICHIER_SORTIE";
	NB_LIGNES=$(expr $NB_LIGNES + 1);
done < "$FICHIER_URLS";
echo -e "\t</table>\n</body>" >> "$FICHIER_SORTIE"
