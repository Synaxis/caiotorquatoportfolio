import 'package:flutter/material.dart';
void main()=>runApp(const MiniApp());
class MiniApp extends StatefulWidget{const MiniApp({super.key});@override State<MiniApp> createState()=>_MiniAppState();}
class _MiniAppState extends State<MiniApp>{
  int tarefas=0;
  @override Widget build(BuildContext context)=>MaterialApp(
    debugShowCheckedModeBanner:false,
    home:Scaffold(
      appBar:AppBar(title:const Text('Mini Metas')),
      body:Center(child:Card(
        margin:const EdgeInsets.all(24),
        child:Padding(
          padding:const EdgeInsets.all(32),
          child:Column(mainAxisSize:MainAxisSize.min,children:[
            const Text('Metas concluídas',style:TextStyle(fontSize:22)),
            Text('$tarefas',style:const TextStyle(fontSize:64,fontWeight:FontWeight.bold)),
            FilledButton(onPressed:()=>setState(()=>tarefas++),child:const Text('Concluir +1')),
            TextButton(onPressed:()=>setState(()=>tarefas=0),child:const Text('Zerar'))
          ]))))));
}
