import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() { //método necessário para rodar a aplicação
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget { //classe inicial
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //material app - material base de desenvolvimento
      home: Scaffold(  //página inicial usando uma tela padrão // é um Widget
        appBar: AppBar(
          title: Text("Olá Mundo")
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
              Fluttertoast.showToast(
                msg: "Olá, Mundo!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
              );
            },
              child: Text("Mostrar mensagem")
              ),
            ),
          ),
      );
  }
}