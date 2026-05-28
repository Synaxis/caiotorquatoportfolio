<?php
$arquivo=__DIR__.'/notas.json';
$notas=file_exists($arquivo)?json_decode(file_get_contents($arquivo),true):[];
if($_SERVER['REQUEST_METHOD']==='POST'){
  $texto=trim($_POST['nota']??'');
  if($texto!=='') $notas[]=['texto'=>$texto,'data'=>date('d/m/Y H:i')];
  file_put_contents($arquivo,json_encode($notas,JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT));
  header('Location: ./'); exit;
}
if(isset($_GET['del'])){
  array_splice($notas,(int)$_GET['del'],1);
  file_put_contents($arquivo,json_encode($notas,JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT));
  header('Location: ./'); exit;
}
function h($v){return htmlspecialchars($v,ENT_QUOTES,'UTF-8');}
?>
<!doctype html><html lang="pt-BR"><meta charset="UTF-8"><title>Mini Diário</title>
<style>body{font-family:system-ui;margin:40px;background:#f8fafc}main{max-width:720px;margin:auto;background:white;padding:28px;border-radius:20px;box-shadow:0 20px 60px #0002}textarea{width:100%;height:90px}button,a{background:#111;color:white;padding:10px 14px;border-radius:12px;text-decoration:none;border:0}li{margin:12px 0;padding:12px;background:#f1f5f9;border-radius:14px}</style>
<main><h1>Mini Diário</h1><form method="post"><textarea name="nota" placeholder="Escreva uma nota curta..."></textarea><br><button>Salvar</button></form>
<ul>
<?php foreach($notas as $i=>$n): ?>
<li><?=h($n['texto'])?><small> - <?=h($n['data'])?></small> <a href="?del=<?=$i?>">apagar</a></li>
<?php endforeach ?>
</ul></main></html>
