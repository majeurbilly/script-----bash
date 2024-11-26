#!/bin/bash
# Demande des informations nécessaires à l'utilisateur
read -r -p "Entrez le nom d'utilisateur (ex : tp3) : " USER_NAME
read -r -p "Entrez le nom du repositoire (ex : repoTP3) : " NOM_REPO
read -r -p "Entrez le nom du dossier à créer (ex : dossierCréé) : " NOM_DOSSIER

# Vérification des champs obligatoires
if [[ -z "$USER_NAME" || -z "$NOM_REPO" || -z "$NOM_DOSSIER" ]]; then
  echo "Erreur : Tous les champs doivent être renseignés."
  exit 1

else
  # Affiche les informations saisies pour confirmation
  echo -e "Nom d'utilisateur : ""$USER_NAME""\nNom du répertoire : ""$NOM_REPO""\nNom du dossier créé : ""$NOM_DOSSIER"""
fi
# Vérification si l'utilisateur existe déjà
if id "$USER_NAME" >/dev/null 2>&1; then
    echo " ERROR : ""$USER_NAME"" exsite deja "
    exit 1
fi
# Vérification si le répertoire principal existe déjà
if [[ -d "/home/""$NOM_REPO""" ]]; then
    echo " ERROR : ""$NOM_REPO"" deja exsitant "
    exit 1
fi
# Création de l'utilisateur avec un répertoire personnalisé
sudo adduser --home /home/"$NOM_REPO"/ "$USER_NAME"
# Création du dossier spécifique pour l'utilisateur
mkdir /home/"$NOM_REPO"/"$NOM_DOSSIER"
# Attribution des permissions sur le dossier
sudo chown "$USER_NAME":"$USER_NAME" /home/"$NOM_REPO"/"$NOM_DOSSIER"
sudo chmod 770 /home/"$NOM_REPO"/"$NOM_DOSSIER"
# Création d'un message de bienvenue dans le dossier
echo "Bienvenue à ""$USER_NAME""" > /home/"$NOM_REPO"/"$NOM_DOSSIER"/message.txt
clear
# Affichage du message de bienvenue à l'utilisateur
cat /home/"$NOM_REPO"/"$NOM_DOSSIER"/message.txt
echo "Bienvenue $USER_NAME sur ton nouveau poste de travail."
echo "Votre répertoire de travail se nomme $NOM_DOSSIER."
echo "Adresse IP : $(hostname -I)"
# Les doubles crochets sont idéaux pour les tests conditionnels dans Bash, 
# notamment parce qu'ils permettent d'utiliser des expressions logiques plus lisibles et plus sûres.
# L'utilisation de guillemets doubles autour des variables est une meilleure pratique en Bash pour prévenir des erreurs liées à l'évaluation des variables. 