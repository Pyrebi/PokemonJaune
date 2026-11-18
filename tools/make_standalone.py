#!/usr/bin/env python3
"""Génère une page HTML autonome (émulateur + ROM intégrés) à partir de web/index.html.

Usage : make_standalone.py <wasmboy.wasm.iife.js> <rom.gbc> <sortie.html>
"""
import base64, sys

lib_path, rom_path, out_path = sys.argv[1:4]
html = open('web/index.html', encoding='utf-8').read()
lib = open(lib_path, encoding='utf-8').read().replace('</script', '<\\/script')
rom = base64.b64encode(open(rom_path, 'rb').read()).decode()

tag = '<script src="https://cdn.jsdelivr.net/npm/wasmboy@0.7.1/dist/wasmboy.wasm.iife.js"></script>'
assert tag in html
html = html.replace(tag, '<script>' + lib + '</script>')

fetch_start = "fetch('pokeyellow.gbc')"
assert fetch_start in html
loader = ("Promise.resolve(Uint8Array.from(atob(ROM_B64), c => c.charCodeAt(0)).buffer)"
          ".then(b => start(new Uint8Array(b), 'pokeyellow.gbc'))\n"
          "  .catch(e => { if (e) console.error(e); say('Erreur au démarrage du ROM intégré.'); });\n")
i = html.index(fetch_start)
j = html.index('</script>', i)
html = html[:i] + "const ROM_B64 = '" + rom + "';\n" + loader + html[j:]
open(out_path, 'w', encoding='utf-8').write(html)
print(out_path, len(html) // 1024, 'Ko')
