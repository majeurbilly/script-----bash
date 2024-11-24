#!/bin/bash
ROUTE_OUEST=$1
ROUTE_SUD=$(($ROUTE_OUEST - 200))
ROUTE_EST=$(($ROUTE_SUD + 300))
ROUTE_NORD=$(($ROUTE_EST + $ROUTE_SUD))
NB_KM_ROUTE_RAPIDE=$ROUTE_OUEST
STRING_ROUTE_RAPIDE="à l'ouest"

echo "---------------------------"
echo route sud : "$ROUTE_SUD"
echo route est : "$ROUTE_EST"
echo route nord : "$ROUTE_NORD"
echo route ouest : "$ROUTE_OUEST"

if [[ $ROUTE_SUD -lt $NB_KM_ROUTE_RAPIDE ]]; then
  NB_KM_ROUTE_RAPIDE="$ROUTE_SUD"
  STRING_ROUTE_RAPIDE="au sud"

elif [[ "$ROUTE_EST" -lt "$NB_KM_ROUTE_RAPIDE" ]]; then
  NB_KM_ROUTE_RAPIDE="$ROUTE_EST"
  STRING_ROUTE_RAPIDE="à l'est"

elif [[ "$ROUTE_NORD" -lt "$NB_KM_ROUTE_RAPIDE" ]]; then
  NB_KM_ROUTE_RAPIDE="$ROUTE_NORD"
  STRING_ROUTE_RAPIDE="au nord"
fi
echo "La route la plus courte est ""$STRING_ROUTE_RAPIDE"", avec une distance de ""$NB_KM_ROUTE_RAPIDE"" M."
