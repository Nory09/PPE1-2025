 #!/usr/bin/bash
cat ../../../Exercices/Exercice1/ann/$1/*_$2_* | grep Location | cut -f 3  | sort |  uniq -c | sort -n | tail -n $3
