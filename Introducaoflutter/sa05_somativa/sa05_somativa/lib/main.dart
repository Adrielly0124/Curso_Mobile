// Importação do pacote Flutter para criar a interface do usuário
import 'package:flutter/material.dart';

// Importação das telas que serão usadas no aplicativo
import 'views/tela_inicial_view.dart';
import 'views/tela_cadastro_view.dart';
import 'views/tela_tarefas_view.dart';

// Função principal que inicia o aplicativo
void main() {
  // O método runApp() é usado para rodar o aplicativo Flutter
  runApp(
    MaterialApp(
      // Remove a faixa de depuração no canto superior direito
      debugShowCheckedModeBanner: false,

      // Define a rota inicial do aplicativo (tela inicial)
      initialRoute: "/",

      // Define as rotas do aplicativo
      routes: {
        // Rota inicial que aponta para a tela inicial (TelaInicial)
        "/": (context) => TelaInicial(),

        // Rota para a tela de cadastro (TelaCadastro)
        "/cadastro": (context) => TelaCadastro(),

        // Rota para a tela de tarefas (TelaTarefas)
        "/entrar": (context) => TelaTarefas(),
      },
    ),
  );
}
