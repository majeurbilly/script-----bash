Exercice 11 - Script bash pas-à-pas
https://github.com/jpduchesneauCegep/ExercicesBash/blob/main/ExerciceScriptBash1.md

Exercice 12 - Script bash 2 - Jouer avec les variables
https://github.com/jpduchesneauCegep/ExercicesBash/blob/main/ExerciceScriptBash1.md

template :
#!/bin/bash

---

# game travel
```bash
ROUTE_EST=$((ROUTE_SUD + 300))
ROUTE_SUD=$((ROUTE_OUEST - 200))
ROUTE_NORD=$((ROUTE_EST + ROUTE_SUD))
ROUTE_RAPIDE=0

if ((ROUTE_RAPIDE < ROUTE_EST)); then
ROUTE_RAPIDE=$ROUTE_EST

if ((ROUTE_RAPIDE < ROUTE_SUD)); then
ROUTE_RAPIDE=$ROUTE_SUD

if ((ROUTE_RAPIDE < ROUTE_NORD))
ROUTE_RAPIDE=$ROUTE_NORD

echo "La route la plus rapide est : $ROUTE_RAPIDE" 


```
```c#
int routeEst = routeSud + 300;
int routeSud = routeOuest - 200;
int routeNord = routeSud + routeOuest;
int routeLaPlusCourte = 0;

if (routeLaPlusCourte < routeEst)
routeLaPlusCourte = routeEst

else if (routeLaPlusCourte < routeSud)
routeLaPlusCourte = routeSud

else if (routeLaPlusCourte < routeNord)
routeLaPlusCourte = routeNord

print(routeLaPlusCourte)


```
