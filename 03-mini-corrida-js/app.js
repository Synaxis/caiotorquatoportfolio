const c=document.querySelector("#game"),ctx=c.getContext("2d"),score=document.querySelector("#score");
let car={x:160,y:485,w:40,h:58},obs=[],keys={},pts=0,over=false;
onkeydown=e=>keys[e.key.toLowerCase()]=true;
onkeyup=e=>keys[e.key.toLowerCase()]=false;
const hit=(a,b)=>a.x<b.x+b.w&&a.x+a.w>b.x&&a.y<b.y+b.h&&a.y+a.h>b.y;
function loop(){
  if(over)return draw();
  pts++; if(keys.arrowleft||keys.a)car.x-=6; if(keys.arrowright||keys.d)car.x+=6;
  car.x=Math.max(18,Math.min(c.width-car.w-18,car.x));
  if(pts%42===0)obs.push({x:24+Math.random()*292,y:-40,w:34,h:34});
  obs.forEach(o=>o.y+=6); obs=obs.filter(o=>o.y<590); over=obs.some(o=>hit(car,o));
  draw(); requestAnimationFrame(loop);
}
function draw(){
  ctx.fillStyle="#111827";ctx.fillRect(0,0,c.width,c.height);
  ctx.fillStyle="#374151";ctx.fillRect(18,0,324,c.height);
  ctx.fillStyle="#f8fafc";for(let y=pts%80-80;y<c.height;y+=80)ctx.fillRect(176,y,8,42);
  ctx.fillStyle="#22c55e";ctx.fillRect(car.x,car.y,car.w,car.h);
  ctx.fillStyle="#ef4444";obs.forEach(o=>{ctx.beginPath();ctx.arc(o.x+17,o.y+17,17,0,7);ctx.fill()});
  score.textContent=over?`Fim: ${pts} pontos - clique para reiniciar`:`Pontos: ${pts}`;
}
c.onclick=()=>over&&location.reload();loop();
