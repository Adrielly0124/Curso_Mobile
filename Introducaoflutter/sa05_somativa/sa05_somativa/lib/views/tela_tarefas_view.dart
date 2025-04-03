import 'package:flutter/material.dart';
import 'package:sa05_somativa/views/tela_painel_grafico_view.dart';

class TelaTarefas extends StatefulWidget {
  @override
  _TelaTarefasState createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  int _selectedIndex = 0;
  List<String> TarefasPendentes = [
    "Finalizar relatório semanal",
    "Revisar código do projeto",
    "Preparar apresentação para reunião",
    "Atualizar documentação técnica",
  ];
  List<String> TarefasConcluidas = [
    "Enviar e-mail para cliente",
    "Corrigir bugs no sistema",
    "Realizar backup do servidor",
    "Atualizar planilha de custos",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 0, 0),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Nenhuma notificação no momento')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Configurações Desabilitadas')),
              );
            },
          ),
        ],
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        title: Text("Gerenciador de Tarefas"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PainelGrafico()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                // Ação para Configurações
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              onTap: () {
                // Ação para Ajuda
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tarefas Pendentes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                color: Color.fromARGB(223, 255, 255, 255),
              ),
            ),
            Container(
              width: 400,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tarefas Concluídas",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                color: Color.fromARGB(223, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}