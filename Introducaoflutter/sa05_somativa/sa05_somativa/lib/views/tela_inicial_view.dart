import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 0, 0),
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 128, 0, 0)),
      body: Center(
        child: Container(
          width: 400,
          height: 400, // Largura do container
          padding: const EdgeInsets.all(32), // Espaçamento interno
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255), // Cor de fundo
            borderRadius: BorderRadius.circular(12), // Bordas arredondadas
            border: Border.all(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: 2,
            ), // Borda
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max, // Ajusta o tamanho ao conteúdo
            crossAxisAlignment:
                CrossAxisAlignment.center, // Alinha os textos à esquerda
            children: [
              const Text(
                'Bem-vindo ao Gerenciador de Tarefas',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8), // Espaço entre os textos
              const Text(
                'Clique no botão abaixo para entrar ou cadastre-se!',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              const SizedBox(height: 16), // Espaço antes do botão
              ElevatedButton(
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
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
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
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
