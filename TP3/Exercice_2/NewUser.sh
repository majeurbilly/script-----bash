#!/bin/bash
read -p "Entrez le nom du projet (ex : tp3) : " nom_projet
read -p "Entrez le nom du dépôt (ex : repoTP3) : " nom_repo 
read -p "Entrez le nom du dossier à créer (ex : dossierCréé) : " nom_dossier

if id "$nom_projet" >/dev/null 2>&1; then
    if [ -d /home/$nom_repo/ ]; then
        sudo adduser $nom_projet --home /home/$nom_repo/
        mkdir /home/$nom_repo/$nom_dossier
        sudo chmod 770 /home/$nom_repo/$nom_dossier
        echo "Bienvenu au TP3" >>  /home/$nom_repo/$nom_dossier/message.txt
        cat /home/$nom_repo/$nom_dossier/message.txt
        echo " Bienvenu $nom_projet sur ton nouveau poste de travail "
        echo " votre repertoire de travail ce nomme $nom_dossier "
        echo $(hostname -I)
    else
        echo " ERROR : repo deja exsitant "
    fi
else 
    echo " ERROR : tp3 exsite deja "
fi