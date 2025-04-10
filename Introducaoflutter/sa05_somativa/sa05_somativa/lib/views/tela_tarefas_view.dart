// ignore_for_file: sort_child_properties_last

// Importação dos pacotes necessários
import 'package:flutter/material.dart';
import 'package:sa05_somativa/views/tela_painel_grafico_view.dart';

// Classe principal do widget de tarefas
class TelaTarefas extends StatefulWidget {
  @override
  _TelaTarefasState createState() => _TelaTarefasState();
}

// Classe de estado para gerenciar o estado do widget TelaTarefas
class _TelaTarefasState extends State<TelaTarefas> {
  // Índice selecionado para navegação (não utilizado diretamente no código atual)


  // Controlador para o campo de texto onde o usuário digita novas tarefas
  final TextEditingController _tarefaController = TextEditingController();

  // Lista de tarefas pendentes
  List<String> TarefasPendentes = [
    "Finalizar relatório semanal",
    "Revisar código do projeto",
    "Preparar apresentação para reunião",
    "Atualizar documentação técnica",
  ];

  // Lista de tarefas concluídas
  List<String> TarefasConcluidas = [
    "Enviar e-mail para cliente",
    "Corrigir bugs no sistema",
    "Realizar backup do servidor",
    "Atualizar planilha de custos",
  ];

  // Função para adicionar uma nova tarefa à lista de tarefas pendentes
  void _adicionarTarefa() {
    // Verifica se o campo de texto não está vazio
    if (_tarefaController.text.trim().isNotEmpty) {
      setState(() {
        // Adiciona a tarefa à lista de tarefas pendentes
        TarefasPendentes.add(_tarefaController.text.trim());
        // Limpa o campo de texto
        _tarefaController.clear();
      });
    }
  }



  // Método que constrói a interface do widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cor de fundo do Scaffold
      backgroundColor: Color.fromARGB(255, 128, 0, 0),
      appBar: AppBar(
        // Botões de ações no AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Exibe uma mensagem de notificação
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Nenhuma notificação no momento')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Exibe uma mensagem de configurações desabilitadas
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Configurações Desabilitadas')),
              );
            },
          ),
        ],
        // Cor de fundo do AppBar
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        // Título do AppBar
        title: Text("Gerenciador de Tarefas"),
        centerTitle: true,
      ),
      // Menu lateral (Drawer)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Cabeçalho do menu
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 128, 0, 0),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // Opção de menu: Dashboard
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                // Navega para a tela PainelGrafico
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PainelGrafico()),
                );
              },
            ),
            // Opção de menu: Configurações
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                // Ação para Configurações (não implementada)
              },
            ),
            // Opção de menu: Ajuda
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              onTap: () {
                // Ação para Ajuda (não implementada)
              },
            ),
          ],
        ),
      ),
      // Corpo principal do aplicativo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Campo de texto e botão para adicionar tarefas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255), // Cor de fundo
                  borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                ),
                padding: const EdgeInsets.all(8.0), // Espaçamento interno
                child: Row(
                  children: [
                    // Campo de texto para digitar uma nova tarefa
                    Expanded(
                      child: TextField(
                        controller: _tarefaController,
                        decoration: InputDecoration(
                          labelText: "Digite uma nova tarefa",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Botão para adicionar a tarefa
                    ElevatedButton(
                      onPressed: _adicionarTarefa,
                      child: Text("Adicionar"),
                    ),
                  ],
                ),
              ),
            ),
            // Lista de tarefas pendentes
            Container(
              width: 400,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "    Tarefas Pendentes",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: TarefasPendentes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(TarefasPendentes[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              // Move a tarefa para a lista de concluídas
                              setState(() {
                                TarefasConcluidas.add(TarefasPendentes[index]);
                                TarefasPendentes.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            // Lista de tarefas concluídas
            Container(
              width: 400,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "    Tarefas Concluídas",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: TarefasConcluidas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(TarefasConcluidas[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Remove a tarefa da lista de concluídas
                              setState(() {
                                TarefasConcluidas.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}