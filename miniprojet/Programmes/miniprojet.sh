#!/usr/bin/bash
FICHIER_URLS=$1
FICHIER_SORTIE=$2
if [ $# -ne 2 ]
then
	echo "Ce script demande 2 arguments : Le chemin du fichier d'urls et le chemin du fichier de sortie"
	exit
fi
NB_LIGNES=1
echo -e "<html>
<head>
	<meta charset=\"UTF-8\">
	<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css\">
</head>
<body>
	<div class=\"content is-large\">
		<h1 class=\"title is-1 has-text-centered\">Mini Projet : Résultats</h1>
	</div>
	<table class = \"table is-bordered is-hoverable is-fullwidth\">
		<tr class=\"is-link\">
			<th>Ligne</th>
			<th>Adresse</th>
			<th>Réponse</th>
			<th>Encodage</th>
			<th>Nombre de Mots</th>
		</tr>" >> "$FICHIER_SORTIE"

while read -r line;
do
	CODE_HTTP=$(curl -i -L ${line} | grep -E "^HTTP/2 "*"" | tr -d "\r\n")
		if [ -z "${CODE_HTTP}" ]
		then
			CODE_HTTP="N/A"
		fi
	ENCODAGE=$(curl -i -L ${line} | grep -P -o "charset=\"\S+\""| cut -d"=" -f2)
		if [ -z "${ENCODAGE}" ]
		then
			ENCODAGE="N/A"
		fi
	N_MOTS=$(lynx -dump -nolist ${line} | wc -w)
	if [ ${ENCODAGE} = "N/A" ]
	then
		echo -e "		<tr class=\"is-warning\">
			<td>$NB_LIGNES</td>
			<td>${line}</td>
			<td>$CODE_HTTP</td>
			<td>$ENCODAGE</td>
			<td>$N_MOTS</td>
		</tr>" >> "$FICHIER_SORTIE";
	else
		echo -e "		<tr class=\"is-info\">
			<td>$NB_LIGNES</td>
			<td>${line}</td>
			<td>$CODE_HTTP</td>
			<td>$ENCODAGE</td>
			<td>$N_MOTS</td>
		</tr>" >> "$FICHIER_SORTIE";
	fi
	NB_LIGNES=$(expr $NB_LIGNES + 1);
done < "$FICHIER_URLS";

echo -e "	</table>
	<div class=\"content has-text-centered\">
		<note> Note : Les informations liées à la ligne 6 (colorée en jaune), n'ont pas pu être récupérée, le site correspondant n'étant pas à jour un niveau du certificat SSL.</note>
	</div>
</body>
</html>" >> "$FICHIER_SORTIE"
