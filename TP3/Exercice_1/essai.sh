#!/bin/bash

# Lecture de la distance pour la route ouest
read -r -p "Entrez la distance que vous voulez avoir à la route Ouest : " ROUTE_OUEST

# Vérification si une entrée valide est fournie
if [[ -z "$ROUTE_OUEST" || ! "$ROUTE_OUEST" =~ ^[0-9]+$ ]]; then
  echo "Erreur : Vous devez entrer un nombre entier positif."
  exit 1
fi

# Calcul des distances
ROUTE_SUD=$(($ROUTE_OUEST - 200))
ROUTE_EST=$(($ROUTE_SUD + 300))
ROUTE_NORD=$(($ROUTE_EST + $ROUTE_SUD))
NB_KM_ROUTE_RAPIDE=$ROUTE_OUEST
STRING_ROUTE_RAPIDE="à l'ouest"

# Vérification pour éviter des valeurs négatives
if [[ $ROUTE_SUD -lt 0 ]]; then
  echo "Erreur : La route sud a une distance négative ($ROUTE_SUD km)."
  exit 1
fi
if [[ $ROUTE_EST -lt 0 ]]; then
  echo "Erreur : La route est a une distance négative ($ROUTE_EST km)."
  exit 1
fi
if [[ $ROUTE_NORD -lt 0 ]]; then
  echo "Erreur : La route nord a une distance négative ($ROUTE_NORD km)."
  exit 1
fi

# Affichage des résultats intermédiaires
echo "---------------------------"
echo "Route sud : $ROUTE_SUD km"
echo "Route est : $ROUTE_EST km"
echo "Route nord : $ROUTE_NORD km"
echo "Route ouest : $ROUTE_OUEST km"

# Détermination de la route la plus courte
if [[ $ROUTE_SUD -lt $NB_KM_ROUTE_RAPIDE ]]; then
  NB_KM_ROUTE_RAPIDE=$ROUTE_SUD
  STRING_ROUTE_RAPIDE="au sud"
fi

if [[ $ROUTE_EST -lt $NB_KM_ROUTE_RAPIDE ]]; then
  NB_KM_ROUTE_RAPIDE=$ROUTE_EST
  STRING_ROUTE_RAPIDE="à l'est"
fi

if [[ $ROUTE_NORD -lt $NB_KM_ROUTE_RAPIDE ]]; then
  NB_KM_ROUTE_RAPIDE=$ROUTE_NORD
  STRING_ROUTE_RAPIDE="au nord"
fi

# Affichage du résultat final
echo "La route la plus courte est $STRING_ROUTE_RAPIDE, avec une distance de $NB_KM_ROUTE_RAPIDE km."
