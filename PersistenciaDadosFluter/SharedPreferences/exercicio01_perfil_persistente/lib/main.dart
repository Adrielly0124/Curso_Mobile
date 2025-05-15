import 'package:flutter/material.dart';
import 'pagina_perfil.dart';

void main() { //função principal, que vai fazer rodar a tela inicial 
  runApp(AppMeuPerfil());//widget principal do app - raiz (principal - elementos visuais)
  // O AppMeuPerfil é um widget que representa o aplicativo
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
