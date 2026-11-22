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
  Après la Ligue, il devient un tuteur complet : toute la liste par niveau (même
  les capacités futures) et toutes les CT/CS compatibles, sans avoir la CT.

- **Puissance des capacités** affichée dans le résumé d'un Pokémon (« PUI »), dans
  la confirmation du Maître des capacités et dans le message « ... veut apprendre ».
  « - » pour les capacités de statut ou à dégâts fixes.

- **Confort** :
  - courir en maintenant B (à pied ou en surf) ;
  - SELECT pour monter sur la BICYCLETTE ou en descendre ;
  - vitesse de texte « INST » (instantané) dans les OPTIONS ;
  - combats plus rapides : barre de PV deux fois plus rapide et pauses
    raccourcies (animations inchangées) ;
  - entrée « SOIGNER » du PC : soigne toute l'équipe.
- **Corrections de bugs d'origine** :
  - les capacités SPECTRE sont super efficaces contre PSY (au lieu de sans effet) ;
  - PUISSANCE double les chances de coup critique (au lieu de les diviser par 4) ;
  - une précision de 100 % ne rate plus jamais (fin du raté à 1/256).
- **DV au maximum** : tout Pokémon obtenu par le joueur (capture, cadeau,
  PIKACHU de départ, envoi dans la boîte) a 15 dans chaque DV. Les Pokémon
  sauvages et ceux des dresseurs ne changent pas.
- **Pokémon spéciaux** (EXP de stats au maximum, bonus conservé aux niveaux,
  évolutions et passages au PC, stats plafonnées à 999) :
  - **Super PIKACHU** (celui du PROF.CHEN) : stats ×1,5 et Ballon Lumière
    intégré (puissance des capacités ELECTRIK doublée). Dans une partie déjà
    commencée, il est mis à niveau au moment de CONTINUER ;
  - **Pokémon « stars »** : stats ×1,25 pour tous les Pokémon obtenus hors combat
    (BULBIZARRE, SALAMECHE, CARAPUCE, LOKHLASS, EVOLI, KICKLEE/TYGNON, fossiles,
    lots du CASINO, échanges, MAGICARPE) et pour les légendaires capturés
    (ARTIKODIN, ELECTHOR, SULFURA, MEWTWO, MEW).
- **Événement MEW : la légende du camion** : après la Ligue, le marin de CARMIN
  laisse passer (« L'OCEANE est de retour au port ! ») ; sur le quai, on peut
  désormais marcher jusqu'au camion. Quelque chose bouge dessous : MEW, niveau
  30 (Pokémon « star »). Tant qu'il n'est pas capturé, on peut retenter. La
  rencontre aléatoire de MEW à la CAVERNE AZUREE est retirée.
- **Champions d'arène renforcés** : DV au maximum pour les champions, le
  Conseil 4 et le Maître ; équipes complétées (Pierre 3, Ondine 4, Major Bob 4,
  Erika 5, Koga, Morgane et Giovanni 6, Auguste 5, Conseil 4 à 6 Pokémon) et
  quelques niveaux en plus en début de jeu.
- **Options bonus supplémentaires** : COURSE AUTO (courir sans tenir B, B fait
  alors marcher), RENCONTRES (NON = aucune rencontre sauvage, comme un Repousse
  infini) et ARGENT ×2 (contre les dresseurs). L'écran OPTIONS passe à une
  option par ligne.
- **Petits plus** : la pêche mord toujours ; PIERRE LUNE (CENTRE COMMERCIAL 4e)
  et SUPER BONBON (5e) en vente à CELADOPOLE ; le type des capacités (abrégé)
  est affiché dans le résumé avec la puissance ; une Poké Ball s'affiche à côté
  d'un Pokémon sauvage déjà capturé ; l'amitié et l'humeur de PIKACHU ne
  baissent plus.
- **FORCE** reste active d'une zone à l'autre ; **Parc Safari** : 1000 pas et
  50 SAFARI BALLS ; **Casino** : gains des machines à sous doublés.
- **Icônes de Pokémon Cristal** dans le menu de l'équipe, l'écran de surnom et
  l'échange : 33 icônes animées (contre 11 en Jaune), reprises du désassemblage
  [pret/pokecrystal](https://github.com/pret/pokecrystal) (`gfx/icons/crystal`).
  Chaque Pokémon de l'équipe a son icône chargée dans son propre emplacement.
- **Pokédex de la zone** : SELECT dans la liste du Pokédex affiche les Pokémon
  sauvages de l'endroit exact où l'on se trouve (étage de grotte compris) :
  herbe/grotte, surf et pêche (CANNE, SUPER CANNE, MEGA CANNE), avec le niveau
  maximal et la fréquence. Poké Ball = déjà capturé, « ????? » = jamais vu.
- **Encore du confort** : la fuite réussit toujours contre les Pokémon sauvages ;
  soin express au Centre Pokémon (sans discours ni animation de la machine) ;
  CORDE SORTIE réutilisable ; les stats de base (et leur total) s'affichent sur
  une page de plus dans la fiche INFO du Pokédex.
- **Objets cachés visibles** : une mini Poké Ball s'affiche sur la case de chaque
  objet caché pas encore ramassé (elle disparaît une fois l'objet trouvé, et
  pendant les textes et menus). Il faut toujours appuyer sur A devant la case.
- **PC de LEO** : un Pokémon déposé est soigné (PV, statut, PP) ; nouvelle
  entrée « DEPLACER » (à la place de l'impression de BOITE) pour envoyer un
  Pokémon de la BOITE actuelle vers une autre BOITE sans passer par l'équipe
  (sauvegarde la partie, comme un changement de BOITE).
- **Cadeau du PROF.CHEN** : la première fois qu'un PC est allumé (même celui de
  la chambre), 8 Pokémon emblématiques de la série arrivent au niveau 5 dans la
  BOITE, en Pokémon « stars » : CHENIPAN, ROUCOOL, KRABBY, FEROSINGE, TAUROS,
  FANTOMINUS, TADMORV et RONFLEX (il faut 8 places libres dans la BOITE).
- **Rééquilibrage** (valeurs inspirées des jeux suivants) :
  - capacités : DARD-NUEE 25 (précision 95 %), VAMPIRISME 50, DOUBLE-DARD 30,
    LECHOUILLE 30, TORNADE de type VOL ;
  - stats de base : CANARTICHO ATQ 90, DARDARGNAN ATQ 90, PAPILUSION SPE 90,
    ARBOK ATQ 95, TRIOPIKEUR ATQ 100, GRODOUDOU SPE 75, ONIX PV 50 et ATQ 70.
- **Informations** : les DV (0-15) dans le résumé, à côté de chaque statistique et
  sous les PV ; amitié et humeur du PIKACHU de départ en page 2 du résumé.

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

Boutons : Pause, « Sauv. état » / « Charg. état » (instantané de l'émulateur, gardé dans le
navigateur, ou seulement pendant la visite en navigation privée), Vitesse, Son, « Exporter la partie » (fichier `.pjsave` : sauvegarde du jeu +
état exact du moment) et « Importer une partie » (accepte aussi un `.sav` de 32 Ko). L'import
fonctionne aussi en navigation privée, où le navigateur ne conserve rien d'une visite à l'autre.
Le bouton « Charger un ROM » n'apparaît que si aucun ROM n'est intégré ou servi à côté de la page.

Clavier : flèches = croix, X = A, Z (ou W) = B, Entrée = Start, Maj droite / Retour arrière = Select.

Les ROM compilés (`*.gbc`) ne sont pas versionnés (voir `.gitignore`).
