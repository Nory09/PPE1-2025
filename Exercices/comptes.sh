 #!/usr/bin/bash
#Les chemins dans les commandes correspondent à mon arborescence
echo "Nombre d'annotations 2016 :"
cat ../../../Exercices/Exercice1/ann/2016/2016* | wc -l
echo "Nombre d'annotations 2017 :"
cat ../../../Exercices/Exercice1/ann/2017/2017* | wc -l
echo "Nombre d'annotations 2018 :"
cat ../../../Exercices/Exercice1/ann/2018/2018* | wc -l
echo "Nombre d'occurrences de \"Location\" 2016 :"
cat ../../../Exercices/Exercice1/ann/2016/2016* | grep Location | wc -l
echo "Nombre d'occurrences de \"Location\" 2017 :"
cat ../../../Exercices/Exercice1/ann/2017/2017* | grep Location | wc -l
echo "Nombre d'occurrences de \"Location\" 2018 :"
cat ../../../Exercices/Exercice1/ann/2018/2018* | grep Location | wc -l

