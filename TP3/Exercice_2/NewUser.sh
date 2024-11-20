#!/bin/bash
# crée un nouveau utilisateur + crée un répertoire pour ce nouvel utilisateur
if id "tp3" >/dev/null 2>&1; then
    if [-d /home/repoTP3/]; then
        sudo adduser tp3 --home /home/repoTP3/
        mkdir /home/repoTP3/DossierCréé
        sudo chmod ------rw- /home/repoTP3/DossierCréé
        echo "Bienvenu au TP3" >>  /home/repoTP3/DossierCréé/message.txt
        cat /home/repoTP3/DossierCréé/message.txt
        echo " Bienvenu tp3 sur ton nouveau poste de travail " #todo
        echo " votre repertoire de travail ce nomme DossierCréé "
        echo $(hostname -I)
    else
        echo " ERROR : repo deja exsitant "
    fi
   

else 
    echo " ERROR : tp3 exsite deja "
fi
# 4. Éviter la création de répertoire déjà existant.
# 6. Utilisez la commande ip pour trouver l’adresse ip de la carte réseau.
# Pour exécuter le script, vous devez donner les permissions d’exécution sur le fichier et l’exécuter en utilisant la commande bash.
# Si vous avez réussi à créer le script et à l exécuter correctement, vous devriez voir afficher le contenu du fichier message.txt dans la sortie de terminal














