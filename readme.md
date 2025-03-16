# Repo officiel du GDGM2

Par Gautier KLEIN

## Ajuster les paramètres en cours de partie

Les fonction suivantes prennent souvent un camp en paramètre

``` {SQF}
rouge = east 
vert = independent 
bleu = west
```

Tout le code suivant est à executer sur serveur

### Ajouter des supplies

``` {SQF}
[camp, points] call GDGM_addPoints;
```

Exemple :

``` {SQF}
[east, 200] call GDGM_addPoints;
```

### Ajouter des reserves

``` {SQF}
[camp, points] call GDGM_addReserves;
```

Exemple :

``` {SQF}
[east, 200] call GDGM_addReserves;
```

### Ajouter des véhicules

amount = nb of [trucks, apcs, tanks, transport helos, combat aircrafts]
transport helos, combat aircrafts pas implémentés

``` {SQF}
[camp, amount] call GDGM_addVehReserves;
```

Exemple :
Ajoute 10 camions, 5 blindés et 1 tank à rouge

``` {SQF}
[east, [10, 5, 1, 0, 0]] call GDGM_addVehReserves;
```

### Ajuster la difficultés pour les pilotes

Voilà la liste des paramètres pour le systèmes de réponse arerienne, changeables à tout moment

``` {SQF}
GDGM_enablePlaneMode = true; //activer ou desctiver le mode avion, quand false pas de mission aerienne et pas de réponse aerienne
GDGM_maxPlaneRaidNb = 1;
GDGM_maxHeliRaidNb = 1;
GDGM_threatLevelCoef = 1; //ajout 0.1 * GDGM_threatLevelCoef to threat when man killed by plane
GDGM_airResponseCoef = 1; //coefficient de réponse aerienne 
```

Si le threat level est suppérieur au nombre d'avion spawné, alors GDGM_airResponseCoef avions sont spawné
