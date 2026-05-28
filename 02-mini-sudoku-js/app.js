const puzzle=[1,0,0,4,0,4,1,0,0,1,4,0,4,0,0,1];
const answer=[1,2,3,4,3,4,1,2,2,1,4,3,4,3,2,1];
const grid=document.querySelector("#grid"),msg=document.querySelector("#msg");
const check=document.querySelector("#check"),reset=document.querySelector("#reset");
function draw(){
  grid.innerHTML="";
  puzzle.forEach(n=>{const x=document.createElement("input");x.maxLength=1;x.inputMode="numeric";x.value=n||"";x.disabled=!!n;x.oninput=()=>x.value=x.value.replace(/[^1-4]/g,"");grid.append(x)});
  msg.textContent="Preencha de 1 a 4.";msg.className="";
}
check.onclick=()=>{const vals=[...grid.children].map(x=>+x.value);const ok=vals.every((v,i)=>v===answer[i]);msg.textContent=ok?"Perfeito, solução correta!":"Ainda não. Revise linhas e blocos.";msg.className=ok?"ok":"bad"};
reset.onclick=draw;
draw();
