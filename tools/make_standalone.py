#!/usr/bin/env python3
"""Génère une page HTML autonome (émulateur binjgb + ROM intégrés) à partir de web/index.html.

Usage : make_standalone.py <rom.gbc> <sortie.html>
"""
import base64, sys

rom_path, out_path = sys.argv[1:3]
html = open('web/index.html', encoding='utf-8').read()
lib = open('web/binjgb.js', encoding='utf-8').read().replace('</script', '<\\/script')
wasm = base64.b64encode(open('web/binjgb.wasm', 'rb').read()).decode()
rom = base64.b64encode(open(rom_path, 'rb').read()).decode()

tag = '<script src="binjgb.js"></script>'
assert tag in html
html = html.replace(tag, '<script>window.BINJGB_WASM = Uint8Array.from(atob("' + wasm +
                    '"), c => c.charCodeAt(0));</script>\n<script>' + lib + '</script>')

fetch_start = "fetch('pokeyellow.gbc')"
assert fetch_start in html
loader = ("start(Uint8Array.from(atob(ROM_B64), c => c.charCodeAt(0)), 'pokeyellow.gbc')"
          ".catch(e => { console.error(e); say('Erreur au démarrage du ROM intégré.'); });\n")
i = html.index(fetch_start)
j = html.index('</script>', i)
html = html[:i] + "const ROM_B64 = '" + rom + "';\n" + loader + html[j:]
open(out_path, 'w', encoding='utf-8').write(html)
print(out_path, len(html) // 1024, 'Ko')
