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
        body: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, //alinhamento dos elementos na vertical
          crossAxisAlignment:
              CrossAxisAlignment
                  .center, //alinhamento dos elementos na horizontal
          children: [
            Text("Linha 1"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Coluna1"), Text("Coluna 2")],
            ),
            Text("Linha3"),
          ],
        ),
      ),
    );
  }
}
