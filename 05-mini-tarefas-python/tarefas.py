from pathlib import Path
import json, sys
ARQ=Path("tarefas.json")
def ler():
    return json.loads(ARQ.read_text("utf-8")) if ARQ.exists() else []
def salvar(tarefas):
    ARQ.write_text(json.dumps(tarefas,ensure_ascii=False,indent=2),"utf-8")
def listar(tarefas):
    print("\n".join(f"{i+1}. [{'x' if t['ok'] else ' '}] {t['txt']}" for i,t in enumerate(tarefas)) or "Sem tarefas.")
tarefas=ler()
cmd=sys.argv[1] if len(sys.argv)>1 else "list"
if cmd=="add" and len(sys.argv)>2:
    tarefas.append({"txt":" ".join(sys.argv[2:]),"ok":False});salvar(tarefas)
elif cmd=="done" and len(sys.argv)>2:
    tarefas[int(sys.argv[2])-1]["ok"]=True;salvar(tarefas)
elif cmd=="clear":
    salvar([])
else:
    listar(tarefas)
