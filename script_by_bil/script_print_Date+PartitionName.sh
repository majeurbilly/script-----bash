#!/bin/bash
FICHIER="espaceDisque.txt"

date >> $FICHIER
df -H | grep /dev/sd >> $FICHIER
# Attention: modifiez au besoin en fonction de votre sortie à la commande df -H

cat $FICHIER
# Attention:  à la première ligne du script, n'oubliez pas de préciser le shebang.
