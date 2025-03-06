import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
            const Text("Perfil do Usuário", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    margin: EdgeInsets.all(50),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.black,
                      ),
                    ),
                    const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                    ),
                ],
              ),
               ),
                    const SizedBox(height: 10,),
                    const Text("Adrielly Dantas de Oliveira", 
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    const Text("Idade: 17 anos"),
                    const Text("Profissão: Estudante "),
                    const Text("Localização: São Paulo, Brasil"),
           Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //alinhamento dos elementos do eixo principal - no caso da linha, na horizontal
                crossAxisAlignment: CrossAxisAlignment.center, //alinhamento dos elementos do eixo secundário - no caso da linha, na vertical
                children: [
                  Container(
                    width: 100,
                    margin: EdgeInsets.all(50),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.all(50),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Container(
                    width: 100,
                    margin: EdgeInsets.all(50),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
           ),
           const SizedBox(height: 190),
                    
           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  IconButton(
                    icon: Icon(Icons.email, size: 30, color: Colors.red),
                    onPressed: () {
                      print('Entrar em Contato');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.facebook, size: 30, color: const Color.fromARGB(255, 0, 78, 194)),
                    onPressed: () {
                      print('Entrar em Contato');
                    },
                  ),
                 
                  IconButton(
                    icon: Icon(Icons.phone, size: 30, color: Colors.green),
                    onPressed: () {
                      print('Ligar');
                    },
                  ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.all(50),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                ],
                ), 
            ],
          ),
        ),
      ),
    );
  }
}
