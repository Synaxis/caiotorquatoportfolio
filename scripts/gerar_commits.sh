#!/usr/bin/env bash
set -euo pipefail
if [ -d .git ]; then
  echo "Já existe uma pasta .git aqui. Remova-a para recriar o histórico do zero."
  exit 1
fi
if git init -b main >/dev/null 2>&1; then
  echo "Repositório criado na branch main."
else
  git init
  git checkout -b main
fi
git config user.name "Caio Torquato"
git config user.email "contatocaio3@gmail.com"
export GIT_AUTHOR_NAME="Caio Torquato"
export GIT_AUTHOR_EMAIL="contatocaio3@gmail.com"
export GIT_COMMITTER_NAME="Caio Torquato"
export GIT_COMMITTER_EMAIL="contatocaio3@gmail.com"
commit(){ local data="$1"; local msg="$2"; shift 2; git add "$@"; GIT_AUTHOR_DATE="$data" GIT_COMMITTER_DATE="$data" git commit -m "$msg" >/dev/null; echo "commit: $msg"; }
commit "2026-05-20T09:10:00-03:00" "chore: inicia portfolio de mini projetos" README.md COMO_RODAR.md .gitignore scripts/verificar_linhas.py
commit "2026-05-20T18:30:00-03:00" "feat: adiciona mini paint em javascript puro" 01-mini-paint-js
commit "2026-05-21T20:05:00-03:00" "feat: cria mini sudoku com validacao" 02-mini-sudoku-js
commit "2026-05-22T19:40:00-03:00" "feat: adiciona jogo de corrida em canvas" 03-mini-corrida-js
commit "2026-05-23T11:15:00-03:00" "feat: cria mini editor de texto em java" 04-mini-editor-java
commit "2026-05-24T16:25:00-03:00" "feat: adiciona utilitario de tarefas em python" 05-mini-tarefas-python
commit "2026-05-25T10:50:00-03:00" "feat: adiciona calculadora imc em kotlin" 06-mini-imc-kotlin
commit "2026-05-26T21:10:00-03:00" "feat: adiciona mini metas em flutter" 07-mini-metas-flutter
commit "2026-05-27T18:45:00-03:00" "feat: adiciona mini diario em php" 08-mini-diario-php
commit "2026-05-27T22:20:00-03:00" "docs: finaliza documentacao dos projetos" docs
printf "\nHistórico criado na branch main. Confira com: git log --oneline --decorate\n"
