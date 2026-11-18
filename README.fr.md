# Pokémon Jaune — copie de travail

Copie du désassemblage [pret/pokeyellow](https://github.com/pret/pokeyellow)
(commit `b452f2ab07185075140061c5084ab866d5e4a794`), avec un lecteur HTML pour jouer au ROM compilé.

## Compiler

Il faut [rgbds 1.0.4](https://rgbds.gbdev.io/install), `make` et `gcc` (voir `INSTALL.md`).

```bash
make
```

Le ROM `pokeyellow.gbc` produit doit avoir le SHA-1 `cc7d03262ebfaf2f06772c1a480c7d9d5f4a38e1` tant que rien n'est modifié (`make compare`).

## Jouer dans le navigateur

```bash
make web
```

```bash
python3 -m http.server 8000 -d web
```

Puis ouvrir http://localhost:8000 : le jeu démarre directement. On peut aussi ouvrir `web/index.html`
sans serveur et choisir le fichier `.gbc` avec le bouton « Charger un ROM ».

Clavier : flèches = croix, X = A, Z (ou W) = B, Entrée = Start, Maj droite / Retour arrière = Select.

Les ROM compilés (`*.gbc`) ne sont pas versionnés (voir `.gitignore`).
