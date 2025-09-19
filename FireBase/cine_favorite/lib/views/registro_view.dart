import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({super.key});

  @override
  State<RegistroView> createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  //atributos
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailField = TextEditingController();
  final _senhaField = TextEditingController();
  final _confirmarSenhaField = TextEditingController();
  bool _ocultarSenha = true;
  bool _ocultarConfirmarSenha = true;

  void _registrar() async{
    if(_senhaField.text != _confirmarSenhaField.text) return;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailField.text.trim(), 
        password: _senhaField.text);
      Navigator.pop(context); 
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao Registrar: $e"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailField,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _senhaField,
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: false,
            ),
            TextField(
              controller: _confirmarSenhaField,
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: true,
            ),
            SizedBox(height: 20,),
            _senhaField.text != _confirmarSenhaField.text 
            ? Text("As senhas devem ser Iguais", 
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), ), )
            : ElevatedButton(onPressed: _registrar, child: Text("Registrar")),
            TextButton(onPressed: () => Navigator.pop, child: Text("Voltar"))
          ],
        ),),
    );
  }
}