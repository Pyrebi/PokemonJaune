# Pokémon Jaune — copie de travail

## Modifications par rapport à l'original

- **Traduction française** : dialogues, menus, combats, noms (Pokémon, attaques,
  objets, lieux, dresseurs) et Pokédex (tailles et poids en mètres / kilogrammes).
  La police a reçu les lettres accentuées à â ç è ê ë î ï ô ù û et le signe +.
- **151 Pokémon accessibles** : nouvelles rencontres sauvages pour ceux qui manquaient
  à la version Jaune (Aspicot, Abo, Miaouss, Smogo, Lippoutou, Elektek, Magmar,
  Raichu, Mew…) ainsi que pour Evoli, Kicklee/Tygnon et les fossiles
  (Amonita/Kabuto à la Méga Canne à Cramois'Ile).
- **Evolutions par échange remplacées par le niveau** : Kadabra (N.36),
  Machopeur (N.40), Gravalanch (N.40), Spectrum (N.38).

- **CT réutilisables et CS oubliables** : une CT n'est plus consommée quand on
  l'utilise, et les capacités CS peuvent être remplacées comme les autres.

- **Repousse** : à la fin de l'effet, le jeu propose d'en utiliser un autre du
  même type s'il en reste.
- **Objets des CS** : SECATEUR (COUPE), TELEPORTEUR (VOL), BATEAU (SURF),
  GANTS (FORCE) et LAMPE (FLASH), donnés avec la CS correspondante. Ils
  s'utilisent depuis le sac, ou avec A devant un arbuste, l'eau ou un rocher
  (« Utiliser ...? »), avec les mêmes conditions que les CS (badges compris).
- **Sac par poches** : OBJETS, BALLS, RARES et CT/CS (Gauche/Droite pour changer).
  60 lignes au lieu de 20 ; les 55 CT/CS sont stockées à part (1 bit chacune)
  et ne prennent donc pas de place. Les CT/CS ne se jettent ni ne se vendent.
  Ce changement rend les sauvegardes des versions précédentes incompatibles.

- **Options bonus** (écran OPTIONS) : CAPT. AUTO (capture à 100 %, sauf contre
  les dresseurs et le Spectre) et MULTI. EXP (×1, ×2, ×3, ×5). Enregistrées
  avec la partie, réglables aussi depuis l'écran titre.

- **Maître des capacités** (entrée « MAITRE CAPA. » du PC) : réapprendre les
  capacités de départ et celles de la liste par niveau jusqu'au niveau actuel.

Outils : `tools/textreflow.py` recoupe les textes à la largeur de la boîte de
dialogue (17 caractères) et vérifie qu'aucune ligne ne dépasse.

Copie du désassemblage [pret/pokeyellow](https://github.com/pret/pokeyellow)
(commit `b452f2ab07185075140061c5084ab866d5e4a794`), avec un lecteur HTML pour jouer au ROM compilé.

## Compiler

Il faut [rgbds 1.0.4](https://rgbds.gbdev.io/install), `make` et `gcc` (voir `INSTALL.md`).

```bash
make
```

Le ROM n'est plus identique à l'original (`make compare` échoue, c'est normal).

## Jouer dans le navigateur

Le lecteur utilise l'émulateur [binjgb](https://github.com/binji/binjgb) (licence MIT,
voir `web/LICENSE-binjgb.txt`), rapide et précis. Pour générer la page autonome :
`python3 tools/make_standalone.py pokeyellow.gbc web/pokemon_jaune.html`.

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
