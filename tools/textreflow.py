#!/usr/bin/env python3
"""Outil de mise en forme des textes du jeu (boîte de dialogue de 18 caractères).

  textreflow.py join  FICHIER...   regroupe chaque paragraphe sur une seule ligne
  textreflow.py wrap  FICHIER...   recoupe les paragraphes à 18 caractères
  textreflow.py check FICHIER...   signale les lignes trop longues

Seuls les blocs « simples » (text/line/cont/para + done/prompt/text_end) sont
recoupés ; les blocs contenant text_ram, text_decimal, etc. sont laissés tels
quels et seulement vérifiés.
"""
import re
import sys

WIDTH = 18
STR_RE = re.compile(r'^(\s*)(text|line|cont|para|next)\s+"(.*)"\s*(;.*)?$')
CMD_RE = re.compile(r'^\s*([a-z_]+)\b')
LABEL_RE = re.compile(r'^[A-Za-z_.][\w.]*:{1,2}\s*$')
TERMS = {'done', 'prompt', 'text_end'}

# largeur à l'écran des symboles spéciaux
SPECIAL = {
    '#': 4, '<PLAYER>': 7, '<RIVAL>': 7, '<PKMN>': 2, '<PC>': 2, '<TM>': 2,
    '<TRAINER>': 7, '<ROCKET>': 6, '<USER>': 17, '<TARGET>': 17, '<……>': 2,
    '<LV>': 1, '<ID>': 1, '<to>': 1, '<DOT>': 1, '<COLON>': 1,
}
TOKEN_RE = re.compile(r'<[^>]*>|.')


def width(s):
    return sum(SPECIAL.get(t, 1) for t in TOKEN_RE.findall(s))


def wrap(s):
    lead = len(s) - len(s.lstrip(' '))
    if width(s) <= WIDTH:
        return [s]
    out = _wrap(s.strip(' '))
    out[0] = ' ' * lead + out[0]
    return out


def _wrap(s):
    words = s.split(' ')
    out, cur = [], ''
    for w in words:
        if not w:
            continue
        cand = w if not cur else cur + ' ' + w
        if width(cand) <= WIDTH or not cur:
            cur = cand
        else:
            out.append(cur)
            cur = w
    out.append(cur)
    return out


def blocks(lines):
    """Découpe en segments : ('raw', [lignes]) ou ('simple', [lignes])."""
    segs, i, n = [], 0, len(lines)
    while i < n:
        m = STR_RE.match(lines[i])
        prev = next((x for x in reversed(lines[:i]) if x.strip()), '')
        if m and m.group(2) == 'text' and LABEL_RE.match(prev):
            j = i
            ok = True
            while j < n:
                l = lines[j]
                sm = STR_RE.match(l)
                if sm:
                    if sm.group(2) == 'next' or (j > i and sm.group(3).startswith('@')):
                        ok = False
                    j += 1
                    continue
                if not l.strip():
                    j += 1
                    continue
                cm = CMD_RE.match(l)
                if cm and cm.group(1) in TERMS:
                    j += 1
                    break
                ok = False
                break
            if ok:
                segs.append(('simple', lines[i:j]))
                i = j
                continue
            # bloc complexe : avancer jusqu'au terminateur
            k = i
            while k < n:
                cm = CMD_RE.match(lines[k])
                k += 1
                if cm and cm.group(1) in TERMS:
                    break
            segs.append(('raw', lines[i:k]))
            i = k
            continue
        segs.append(('raw', [lines[i]]))
        i += 1
    return segs


def paragraphs(block):
    """Retourne [(mot-clé, texte, lignes_vides_avant)] et le terminateur."""
    paras, term = [], []
    for l in block:
        sm = STR_RE.match(l)
        if sm:
            kw, s = sm.group(2), sm.group(3)
            if kw in ('text', 'para'):
                paras.append([kw, s])
            else:
                paras[-1][1] = (paras[-1][1] + ' ' + s) if paras[-1][1] else s
        elif l.strip():
            term.append(l)
    return paras, term


def do_join(block):
    paras, term = paragraphs(block)
    out = []
    for kw, s in paras:
        if kw == 'para':
            out.append('')
        out.append(f'\t{kw} "{s}"')
    return out + term


def do_wrap(block):
    paras, term = paragraphs(block)
    out = []
    for kw, s in paras:
        parts = wrap(s) if s else ['']
        if kw == 'para':
            out.append('')
        out.append(f'\t{kw} "{parts[0]}"')
        for k, p in enumerate(parts[1:]):
            out.append(f'\t{"line" if k == 0 else "cont"} "{p}"')
    return out + term


# la police n'a pas de majuscules accentuées ni de ligatures
SANITIZE = str.maketrans({'É': 'E', 'È': 'E', 'Ê': 'E', 'À': 'A', 'Â': 'A', 'Ç': 'C',
                          'Î': 'I', 'Ô': 'O', 'Ù': 'U', 'Û': 'U', '’': "'", '«': '"', '»': '"'})


def sanitize(line):
    sm = STR_RE.match(line)
    if not sm:
        return line
    s = sm.group(3).translate(SANITIZE).replace('œ', 'oe').replace('…', '...')
    return line[:sm.start(3)] + s + line[sm.end(3):]


def process(path, mode):
    lines = open(path, encoding='utf-8').read().split('\n')
    if mode == 'wrap':
        lines = [sanitize(l) for l in lines]
    out, problems = [], []
    for kind, blk in blocks(lines):
        if kind == 'simple' and mode in ('join', 'wrap'):
            blk = do_join(blk) if mode == 'join' else do_wrap(blk)
        out.extend(blk)
    for no, l in enumerate(out, 1):
        sm = STR_RE.match(l)
        if sm and width(sm.group(3)) > WIDTH and mode != 'join':
            problems.append(f'{path}:{no}: {width(sm.group(3))} > {WIDTH}: {sm.group(3)}')
    if mode in ('join', 'wrap'):
        open(path, 'w', encoding='utf-8').write('\n'.join(out))
    return problems


if __name__ == '__main__':
    mode, files = sys.argv[1], sys.argv[2:]
    allp = []
    for f in files:
        allp += process(f, mode)
    print('\n'.join(allp))
    sys.exit(1 if allp and mode == 'check' else 0)
