#!/bin/bash
read -r -p "Entrez le nom d'utilisateur (ex : tp3) : " USER_NAME
read -r -p "Entrez le nom du repositoire (ex : repoTP3) : " NOM_REPO
read -r -p "Entrez le nom du dossier à créer (ex : dossierCréé) : " NOM_DOSSIER

# Vérification des champs obligatoires
if [[ -z "$USER_NAME" || -z "$NOM_REPO" || -z "$NOM_DOSSIER" ]]; then
  echo "Erreur : Tous les champs doivent être renseignés."
  exit 1

else
  echo -e "Nom d'utilisateur : ""$USER_NAME""\nNom du répertoire : ""$NOM_REPO""\nNom du dossier créé : ""$NOM_DOSSIER"""
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
mkdir /home/"$NOM_REPO"/"$NOM_DOSSIER"
sudo chown "$USER_NAME":"$USER_NAME" /home/"$NOM_REPO"/"$NOM_DOSSIER"
sudo chmod 770 /home/"$NOM_REPO"/"$NOM_DOSSIER"
echo "Bienvenue au TP3" > /home/"$NOM_REPO"/"$NOM_DOSSIER"/message.txt
clear
cat /home/"$NOM_REPO"/"$NOM_DOSSIER"/message.txt
echo "Bienvenue $USER_NAME sur ton nouveau poste de travail."
echo "Votre répertoire de travail se nomme $NOM_DOSSIER."
echo "Adresse IP : $(hostname -I)"