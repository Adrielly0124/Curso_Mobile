import 'package:flutter/material.dart';
import 'pagina_perfil.dart';

void main() {
  runApp(AppMeuPerfil());
}

// App principal com rotas
class AppMeuPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Perfil',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => PaginaPerfil(), // Página inicial do app
      },
    );
  }
}