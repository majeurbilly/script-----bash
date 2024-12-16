### **Feuille de Notes - Bash Scripting**

---

### **1. Commandes de base**
#### **`read` : Lecture d'une entrée utilisateur**
- **Syntaxe** :  
  ```bash
  read -r -p "Message pour l'utilisateur : " NOM_VARIABLE
  ```
  - **`-r`** : Désactive le traitement spécial des backslashes.
  - **`-p`** : Affiche un message avant d'attendre l'entrée.

**Exemple** :
```bash
read -r -p "Entrez le nom d'utilisateur : " USER_NAME
echo "Vous avez saisi : $USER_NAME"
```

---

### **2. Vérification des champs obligatoires**
#### **`-z` : Tester si une variable est vide**
- **Syntaxe** :  
  ```bash
  if [[ -z "$VARIABLE" ]]; then
    echo "Erreur : Champ vide."
    exit 1
  fi
  ```

**Exemple** :
```bash
read -r -p "Entrez un nom : " NOM
if [[ -z "$NOM" ]]; then
  echo "Erreur : Le nom est obligatoire."
  exit 1
fi
```

---

### **3. Vérification de l'existence**
#### **Vérifier si un utilisateur existe**
- **Syntaxe** :
  ```bash
  if id "$USER_NAME" >/dev/null 2>&1; then
    echo "L'utilisateur existe déjà."
    exit 1
  fi
  ```

#### **Vérifier si un répertoire existe**
- **Syntaxe** :
  ```bash
  if [[ -d "/chemin/du/repertoire" ]]; then
    echo "Erreur : Le répertoire existe déjà."
    exit 1
  fi
  ```

---

### **4. Création d'un utilisateur et de dossiers**
#### **Créer un utilisateur avec un répertoire personnalisé**
- **Syntaxe** :  
  ```bash
  sudo adduser --home /home/"$NOM_REPO"/ "$USER_NAME"
  ```

#### **Créer un dossier**
- **Syntaxe** :  
  ```bash
  mkdir /chemin/du/dossier
  ```

#### **Changer les permissions et le propriétaire**
- **Changer le propriétaire** :  
  ```bash
  sudo chown "$USER_NAME":"$USER_NAME" /chemin/du/dossier
  ```
- **Modifier les permissions** :  
  ```bash
  sudo chmod 770 /chemin/du/dossier
  ```

---

### **5. Manipulation des variables numériques**
#### **Calcul arithmétique : `$(())`**
- **Syntaxe** :
  ```bash
  VARIABLE=$((EXP1 + EXP2))
  ```

**Exemple** :
```bash
ROUTE_SUD=$((("$ROUTE_OUEST" - 200))
ROUTE_EST=$((("$ROUTE_SUD" + 300))
```

#### **Vérifier si une entrée est un nombre positif**
- **Syntaxe** :  
  ```bash
  if ! [[ "$ENTREE" =~ ^[0-9]+$ ]]; then
    echo "Erreur : L'entrée doit être un nombre."
    exit 1
  fi
  ```

---

### **6. Comparaison et conditions**
#### **Double crochets `[[ ... ]]`**
- **Syntaxe** :
  ```bash
  if [[ CONDITION ]]; then
    # Action
  fi
  ```

**Exemples de comparaisons** :
| Opérateur | Signification             |
|-----------|---------------------------|
| `-lt`     | Inférieur                 |
| `-le`     | Inférieur ou égal         |
| `-eq`     | Égal                      |
| `-ge`     | Supérieur ou égal         |
| `-gt`     | Supérieur                 |
| `-ne`     | Différent                 |

---

### **7. Tableaux et chaînes**
#### **Afficher des variables**
- **Syntaxe** :  
  ```bash
  echo "Message : $VARIABLE"
  ```

#### **Concaténation de chaînes**
```bash
STRING="La route est à l'ouest"
echo "$STRING"
```

---

### **8. Exemple complet avec logique conditionnelle**
#### **Trouver la route la plus courte**
```bash
# Entrée utilisateur
read -r -p "Entrez la distance de la route ouest : " ROUTE_OUEST

# Vérification si l'entrée est valide
if ! [[ "$ROUTE_OUEST" =~ ^[0-9]+$ ]]; then
  echo "Erreur : Entrée invalide, doit être un nombre positif."
  exit 1
fi

# Calculs
ROUTE_SUD=$(("$ROUTE_OUEST" - 200))
ROUTE_EST=$(("$ROUTE_SUD" + 300))
ROUTE_NORD=$(("$ROUTE_EST" + "$ROUTE_SUD"))

# Initialisation des variables pour la route la plus courte
NB_METRE_ROUTE_RAPIDE="$ROUTE_OUEST"
STRING_ROUTE_RAPIDE="à l'ouest"

# Comparaison pour trouver la plus petite valeur
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

# Affichage des résultats
echo "La route la plus courte est $STRING_ROUTE_RAPIDE, avec une distance de $NB_METRE_ROUTE_RAPIDE mètres."
```

---

### **9. Bonnes pratiques**
1. **Toujours entourer les variables de guillemets** : `"$VARIABLE"`.
2. **Utiliser `-r` avec `read`** pour éviter les problèmes d'échappement.
3. **Tester les champs vides avec `-z`**.
4. **Utiliser `$(())` pour les calculs arithmétiques**.
5. **Privilégier les doubles crochets `[[ ... ]]`** pour les tests conditionnels.

---

### **10. Commandes utiles**
| **Commande**          | **Description**                       |
|------------------------|---------------------------------------|
| `mkdir`               | Créer un dossier                     |
| `chmod`               | Modifier les permissions d'un fichier |
| `chown`               | Changer le propriétaire d'un fichier  |
| `id NOM_UTILISATEUR`  | Vérifier si un utilisateur existe     |
| `echo`                | Afficher du texte                    |
| `sudo adduser`        | Créer un nouvel utilisateur          |
| `clear`               | Effacer l'écran                      |

