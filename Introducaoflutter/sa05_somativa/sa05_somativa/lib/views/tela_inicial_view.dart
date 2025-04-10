// Importação do pacote Flutter para criar a interface do usuário
import 'package:flutter/material.dart';

// Classe principal da tela inicial
class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define a cor de fundo da tela
      backgroundColor: Color.fromARGB(255, 128, 0, 0),

      // AppBar no topo da tela com a mesma cor de fundo
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 128, 0, 0)),

      // Corpo principal da tela
      body: Center(
        child: Container(
          // Define o tamanho do container central
          width: 400,
          height: 400,

          // Espaçamento interno do container
          padding: const EdgeInsets.all(32),

          // Estilização do container
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255), // Cor de fundo
            borderRadius: BorderRadius.circular(12), // Bordas arredondadas
            border: Border.all(
              color: const Color.fromARGB(255, 255, 255, 255), // Cor da borda
              width: 2, // Largura da borda
            ),
          ),

          // Coluna para organizar os elementos verticalmente
          child: Column(
            mainAxisSize: MainAxisSize.max, // Ajusta o tamanho ao conteúdo
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centraliza os textos horizontalmente
            children: [
              // Texto de boas-vindas
              const Text(
                'Bem-vindo ao Gerenciador de Tarefas',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              // Espaçamento entre os textos
              const SizedBox(height: 8),

              // Texto explicativo
              const Text(
                'Clique no botão abaixo para entrar ou cadastre-se!',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              // Espaçamento antes dos botões
              const SizedBox(height: 16),

              // Botão "Entrar"
              ElevatedButton(
                // Navega para a rota "/entrar" (TelaTarefas)
                onPressed: () => Navigator.pushNamed(context, "/entrar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    75,
                    0,
                    0,
                  ), // Cor do botão
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white), // Cor do texto do botão
                ),
              ),

              // Botão "Cadastre-se"
              ElevatedButton(
                // Navega para a rota "/cadastro" (TelaCadastro)
                onPressed: () => Navigator.pushNamed(context, "/cadastro"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    75,
                    0,
                    0,
                  ), // Cor do botão
                ),
                child: const Text(
                  'Cadastre-se',
                  style: TextStyle(color: Colors.white), // Cor do texto do botão
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
