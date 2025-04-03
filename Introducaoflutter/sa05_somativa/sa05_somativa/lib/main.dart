import 'package:flutter/material.dart';

import 'views/tela_inicial_view.dart';
import 'views/tela_cadastro_view.dart';
import 'views/tela_tarefas_view.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context)=> TelaInicial(),
      "/cadastro":(context)=>TelaCadastro(),
      "/entrar": (context)=>TelaTarefas(),
      "/tarefas": (context)=>TelaTarefas(),
    },
  ));
}
