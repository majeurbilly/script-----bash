#!/bin/bash
# crée un nouveau utilisateur + crée un répertoire pour ce nouvel utilisateur
if id "tp3" >/dev/null 2>&1; then
    sudo adduser tp3 --home /home/repoTP3/
    mkdir /home/repoTP3/DossierCréé
    sudo chmod ------rw- /home/repoTP3/DossierCréé
    echo "Bienvenu au TP3" >>  /home/repoTP3/DossierCréé/MessageBienvenue
    cat /home/repoTP3/DossierCréé/MessageBienvenue
    echo " Bienvenu tp3 sur ton nouveau poste de travail "
    echo " votre repertoire de travail ce nomme DossierCréé "
    echo $(hostname -I)

else 
    #todo: error message
fi















