import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplos Colunas(Column) e Linhas(Row)")),
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround, //alinhamento dos elementos do eixo principal - no caso da coluna, na vertical 
            crossAxisAlignment:
                CrossAxisAlignment
                    .center, //alinhamento dos elementos do eixo secundário - no caso da coluna, na horizontal
            children: [
              Text("Linha 1"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //alinhamento dos elementos do eixo principal - no caso da linha, na horizontal
                crossAxisAlignment: CrossAxisAlignment.center, //alinhamento dos elementos do eixo secundário - no caso da linha, na vertical
                children: [Text("Coluna1"), Text("Coluna 2")],
              ),
              Text("Linha3"),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color:Colors.pink,
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Icon(Icons.person)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
