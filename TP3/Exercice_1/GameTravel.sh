#!/bin/bash
# J'ai choisis de conserver la variable ouest et de la faire choisir à l'utilisateur

# Lecture de l'entrée utilisateur pour la distance de la route ouest 
read -r -p "Entrez la distance que vous voulez avoir à la route Ouest : " ROUTE_OUEST

# Vérification si un argument est fourni
if [[ -z "$ROUTE_OUEST" ]]; then
  echo "Erreur : Veuillez fournir une distance pour la route ouest."
  exit 1
fi
# Vérification si l'argument est un nombre positif
if ! [[ "$ROUTE_OUEST" =~ ^[0-9]+$ ]]; then
  echo "Erreur : L'entrée doit être un nombre entier positif."
  exit 1
fi
# Déclaration de mes variables
ROUTE_SUD=$(("$ROUTE_OUEST" - 200))
ROUTE_EST=$(("$ROUTE_SUD" + 300))
ROUTE_NORD=$(("$ROUTE_EST" + "$ROUTE_SUD"))
# En mémoire, la route la plus petit contient la route ouest
NB_METRE_ROUTE_RAPIDE="$ROUTE_OUEST"
STRING_ROUTE_RAPIDE="à l'ouest"

# Tableau contenant toute mes valeurs
echo route sud : "$ROUTE_SUD" Mètres
echo route est : "$ROUTE_EST" Mètres
echo route nord : "$ROUTE_NORD" Mètres
echo route ouest : "$ROUTE_OUEST" Mètres

# Vérification pour éviter des valeurs négatives
if [[ "$ROUTE_SUD" -lt 0 ]]; then
  echo "Erreur : La route sud a une distance négative (""$ROUTE_SUD"" mètre)."
  exit 1
fi
if [[ "$ROUTE_EST" -lt 0 ]]; then
  echo "Erreur : La route est a une distance négative (""$ROUTE_EST"" mètre)."
  exit 1
fi
if [[ "$ROUTE_NORD" -lt 0 ]]; then
  echo "Erreur : La route nord a une distance négative (""$ROUTE_NORD"" mètre)."
  exit 1
fi
# Si la route inspecter est plus petite que la route la plus courte.
# La route inspecter devient la nouvelle valeur de la route la plus courte
if [[ "$ROUTE_SUD" -lt "$NB_METRE_ROUTE_RAPIDE" ]]; then
  NB_METRE_ROUTE_RAPIDE="$ROUTE_SUD"
  STRING_ROUTE_RAPIDE="au sud"

elif [[ "$ROUTE_EST" -lt "$NB_METRE_ROUTE_RAPIDE" ]]; then
  NB_METRE_ROUTE_RAPIDE="$ROUTE_EST"
  STRING_ROUTE_RAPIDE="à l'est"

elif [[ "$ROUTE_NORD" -lt "$NB_METRE_ROUTE_RAPIDE" ]]; then
  NB_METRE_ROUTE_RAPIDE="$ROUTE_NORD"
  STRING_ROUTE_RAPIDE="au nord"
fi
echo "La route la plus courte est ""$STRING_ROUTE_RAPIDE"", avec une distance de ""$NB_METRE_ROUTE_RAPIDE"" mètres."
# Les doubles crochets sont idéaux pour les tests conditionnels dans Bash, 
# notamment parce qu'ils permettent d'utiliser des expressions logiques plus lisibles et plus sûres.
# L'utilisation de guillemets doubles autour des variables est une meilleure pratique en Bash pour prévenir des erreurs liées à l'évaluation des variables. 