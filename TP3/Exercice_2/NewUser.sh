#!/bin/bash
USER_NAME=$(read -r -p "Entrez le nom du USER (ex : tp3) : ")
NOM_REPO=$(read -r -p "Entrez le nom du dépôt (ex : repoTP3) : ")
NOM_DOSSSIER=$(read -r -p "Entrez le nom du dossier à créer (ex : dossierCréé) : ")

# Vérification des champs obligatoires
if [[ -z "$USER_NAME" || -z "$NOM_REPO" || -z "$NOM_DOSSIER" ]]; then
  echo "Erreur : Tous les champs doivent être renseignés."
  exit 1
fi

if id "$USER_NAME" >/dev/null 2>&1; then
    echo " ERROR : ""$USER_NAME"" exsite deja "
    exit 1
fi
if [[ -d "/home/""$NOM_REPO""" ]]; then
    echo " ERROR : ""$NOM_REPO"" deja exsitant "
    exit 1
fi
sudo adduser --home /home/"$NOM_REPO"/ "$USER_NAME"
mkdir /home/"$NOM_REPO"/"$NOM_DOSSSIER"
sudo chown "$USER_NAME":"$USER_NAME" /home/"$NOM_REPO"/"$NOM_DOSSSIER"
sudo chmod 770 /home/"$NOM_REPO"/"$NOM_DOSSSIER"
echo "Bienvenue au TP3" > /home/"$NOM_REPO"/"$NOM_DOSSSIER"/message.txt
cat /home/"$NOM_REPO"/"$NOM_DOSSSIER"/message.txt
echo "Bienvenue $USER_NAME sur ton nouveau poste de travail."
echo "Votre répertoire de travail se nomme $NOM_DOSSSIER."
echo "Adresse IP : $(hostname -I)"