#!/bin/bash
# Ce script automatise la création d'un utilisateur en exécutant un autre script (NewUser.sh),
# enregistre les logs dans un fichier, et supprime ensuite un utilisateur spécifique.
(echo "Jean-Pierre" ; echo "Duchesneau" ; echo "JPD") | bash ./NewUser.sh >> ./testLog.txt
cat ./testLog.txt
sudo deluser --remove-all-files "Jean-Pierre"