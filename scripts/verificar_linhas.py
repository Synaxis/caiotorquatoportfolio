from pathlib import Path
EXT={'.js','.css','.html','.java','.py','.kt','.dart','.php','.yaml'}
limite=30
ok=True
for p in sorted(Path('.').rglob('*')):
    if '.git' in p.parts or p.name.startswith('DOCUMENTACAO'):
        continue
    if p.suffix.lower() in EXT:
        linhas=len(p.read_text('utf-8',errors='ignore').splitlines())
        status='OK' if linhas<=limite else 'PASSOU'
        ok=ok and linhas<=limite
        print(f'{status:6} {linhas:2} linhas - {p}')
raise SystemExit(0 if ok else 1)
