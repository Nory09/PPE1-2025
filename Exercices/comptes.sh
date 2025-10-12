 #!/usr/bin/bash
#Les chemins dans les commandes correspondent à mon arborescence
for i in 2016 2017 2018
do
    echo "Nombre d'occurrences de \"Location\" en $i :"
    cat ../../../Exercices/Exercice1/ann/$i/* | grep Location | wc -l
done
