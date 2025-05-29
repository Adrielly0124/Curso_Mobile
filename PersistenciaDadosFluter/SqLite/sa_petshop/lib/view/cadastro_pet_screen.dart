//formulario de Cadastro do Pet

import 'package:flutter/material.dart';
import 'package:sa_petshop/controllers/pet_controller.dart';
import 'package:sa_petshop/models/pet_model.dart';
import 'package:sa_petshop/view/home_screen.dart';

class CadastroPetScreen extends StatefulWidget{ //tela dinamica que permite mudança de estado depois da construção inicial
  @override
  State<StatefulWidget> createState() => _CadastroScreenState(); //chama a mudança
}

class _CadastroScreenState extends State<CadastroPetScreen>{
 //faz a build da Tela
 //atributos 
 final _formKey = GlobalKey<FormState>(); //chave para armazenamento dos valores do formulário
 final _controllerPet = PetController(); //instancia do controller

 //atributos do objeto
 late String _nome; //final permite que o valor seja atribuído mais de uma vez
 late String _raca;
 late String _nomeDono;
 late String _telefoneDono;

 //cadastrar Pet (salvar no Banco de dados)
 _salvarPet() async { //Future - método assíncrono (pra executar algo enquanto a função carrega, ou seja, pro usuário não achar que o celular travou )
    if(_formKey.currentState!.validate()){
        _formKey.currentState!.save();
        final newPet = Pet(
            nome: _nome,
            raca: _raca,
            nomeDono: _nomeDono,
            telefoneDono: _telefoneDono
        );
        //mandar as info para o BD
        await _controllerPet.createPet(newPet);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())); //volta para a tela inicial
    }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Novo Pet"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child:Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nome do Pet"),
                validator: (value) => value!.isEmpty ? "Campo Obrigatório! Informe o nome do Pet" : null,
                onSaved: (value) => _nome = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Raça do Pet"),
                validator: (value) => value!.isEmpty ? "Campo Obrigatório! Informe a raça do Pet" : null,
                onSaved: (value) => _raca = value!, 
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Nome do Dono"),
                validator: (value) => value!.isEmpty ? "Campo Obrigatório! Informe o nome do dono" : null,
                onSaved: (value) => _nomeDono = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Telefone do Dono"),
                validator: (value) => value!.isEmpty ? "Campo Obrigatório! Informe o telefone do dono" : null,
                onSaved: (value) => _telefoneDono = value!,
              ),
              ElevatedButton(onPressed: _salvarPet, child: Text("Cadastrar Pet"))
            ],
          )
          ),
        ),
    );
  }
}

