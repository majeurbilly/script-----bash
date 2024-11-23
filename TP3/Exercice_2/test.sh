#!/bin/bash
read -p "Entrez le nom du USER (ex : tp3) : " USER_NAME
read -p "Entrez le nom du dépôt (ex : repoTP3) : " NOM_REPO
read -p "Entrez le nom du dossier à créer (ex : dossierCréé) : " NOM_DOSSSIER

if id "$USER_NAME" >/dev/null 2>&1; then
    echo "ERROR : L'utilisateur $USER_NAME existe déjà."
    exit 1
fi
if [[ -d "/home/$NOM_REPO" ]]; then
    echo "ERROR : Le répertoire $NOM_REPO existe déjà."
    exit 1
fi

sudo adduser --home /home/$NOM_REPO/ $USER_NAME
mkdir /home/$NOM_REPO/$NOM_DOSSSIER
sudo chown $USER_NAME:$USER_NAME /home/$NOM_REPO/$NOM_DOSSSIER
sudo chmod 770 /home/$NOM_REPO/$NOM_DOSSSIER
echo "Bienvenue au TP3" > /home/$NOM_REPO/$NOM_DOSSSIER/message.txt
cat /home/$NOM_REPO/$NOM_DOSSSIER/message.txt
echo "Bienvenue $USER_NAME sur ton nouveau poste de travail."
echo "Votre répertoire de travail se nomme $NOM_DOSSSIER."
echo "Adresse IP : $(hostname -I)"