#!/bin/bash
# Ce script exécute quinze fois le script GameTravel.sh, 
# en lui passant des valeurs aléatoires en paramètre compris entre 100 et 1000
for (( i = 0; i < 15; i++ )); do
    bash ./GameTravel.sh $((100 + "$RANDOM" % 1000))
    echo "-------------------------------------------"
done