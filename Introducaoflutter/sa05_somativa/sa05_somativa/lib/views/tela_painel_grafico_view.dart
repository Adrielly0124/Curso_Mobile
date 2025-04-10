import 'package:flutter/material.dart';

// Classe principal que define o widget PainelGrafico
class PainelGrafico extends StatefulWidget {
  @override
  _StatePainelGrafico createState() => _StatePainelGrafico();
}

// Estado associado ao widget PainelGrafico
class _StatePainelGrafico extends State<PainelGrafico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar com título e estilo personalizado
      appBar: AppBar(
        title: Text('Dashboard de Tarefas'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Color.fromARGB(255, 128, 0, 0), // Cor personalizada
        centerTitle: true, // Centraliza o título
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaçamento ao redor do GridView
        child: GridView.count(
          crossAxisCount: 2, // Número de colunas no grid
          crossAxisSpacing: 10, // Espaçamento horizontal entre os itens
          mainAxisSpacing: 10, // Espaçamento vertical entre os itens
          children: [
            // Cada item do grid é um cartão com informações
            _construirCartaoTarefa("Tarefas Pendentes", "12", Colors.orange),
            _construirCartaoTarefa("Tarefas Concluídas", "25", Colors.green),
            _construirCartaoTarefa("Prazos Próximos", "5", Colors.red),
            _construirCartaoTarefa("Total de Tarefas", "37", Colors.blue),
          ],
        ),
      ),
    );
  }

  // Método que constrói um cartão de tarefa
  Widget _construirCartaoTarefa(String titulo, String valor, Color cor) {
    return Card(
      elevation: 4, // Elevação para criar sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Bordas arredondadas
      ),
      color: cor, // Cor de fundo do cartão
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Espaçamento interno do cartão
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente
          children: [
            // Texto que exibe o valor (ex.: número de tarefas)
            Text(
              valor,
              style: TextStyle(
                fontSize: 28, // Tamanho da fonte
                fontWeight: FontWeight.bold, // Negrito
                color: Colors.white, // Cor do texto
              ),
            ),
            SizedBox(height: 10), // Espaçamento entre os textos
            // Texto que exibe o título (ex.: "Tarefas Pendentes")
            Text(
              titulo,
              textAlign: TextAlign.center, // Centraliza o texto
              style: TextStyle(
                fontSize: 16, // Tamanho da fonte
                color: Colors.white, // Cor do texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}

