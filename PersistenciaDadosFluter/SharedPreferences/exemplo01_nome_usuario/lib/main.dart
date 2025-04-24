import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(
    home: UserNamePage(),
  ));
}

//classe da página do usuário

class UserNamePage extends StatefulWidget{
  @override
  _UserNamePageState createState() => _UserNamePageState();
}

class _UserNamePageState extends State<UserNamePage>{
  TextEditingController _controller = TextEditingController();
  String _nomeSalvo = "";

  @override
  void initState(){
    super.initState();
    _carregarNomeSalvo();
  }

  void _carregarNomeSalvo() async { //executado de forma assincrona
    //usar o SharedPreferences para carregar informações salvas //chave-valor
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    _nomeSalvo = prefs.getString('nome')?? ""; //?? caso seja nulo
    });
  }
  void _salvarNome() async {
    //usar o SharedPreferences para salvar as informações
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("nome", _controller.text);
    _carregarNomeSalvo(); //setState para atualizar a tela
    _controller.clear(); //limpa o campo do texto
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Bem-vindo ${_nomeSalvo==""?"Visitante":_nomeSalvo}"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Digite seu nome"),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: _salvarNome, 
            child: Text("Salvar"),
          )
        ],),
      ),
    );
  }
}