import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget{
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  //construção do widget
  //estudo de widgets de interação (Input de Texto, checkbox, ) -> formulário
  //atributos
  //chave de seleção dos componentes do formulário
  final _formKey = GlobalKey<FormState>();
  //atributos do formulário
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _genero = "";
  String _dataNascimento = "";
  double _experiencia = 0;
  bool _aceite = false;

  Widget build(BuildContext contet) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela de Cadastro"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //campo Nome
              TextFormField(
                decoration: InputDecoration(labelText: "Digite seu Nome"),
                validator:
                    (value) =>
                        value!.isEmpty
                            ? "Campo não Preenchido!!!"
                            : null, //Operador Ternário (Condição ? True : False)
                onSaved: (value) => _nome = value!, //formulário
              ),
              SizedBox(height: 20,),
              //Campo Email
              TextFormField(
                decoration: InputDecoration(labelText: "Digite seu Email"),
                validator:
                    (value) =>
                        value!.contains("@") ? null : "digite um e-mail Válido",
                onSaved: (value) => _email = value!,
              ),
              //Campo Senha
              TextFormField(
                decoration: InputDecoration(labelText: "Insira uma Senha"),
                obscureText: true,
                validator: (value) => value!.length < 6 ? "Senha Fraca" : null,
                onSaved: (value) => _senha = value!,
              ),

              //Campo Gênero
              Text("Gênero: "),
              DropdownButtonFormField(
                items:
                    ["Masculino", "Feminino", "Outro"]
                        .map(
                          (String genero) => DropdownMenuItem(
                            value: genero,
                            child: Text(genero),
                          ),
                        )
                        .toList(),
                onChanged: (value) {},
                validator:
                    (value) => value == null ? "Selecione um Gênero" : null,
                onSaved: (value) => _genero = value!,
              ),
              //Campo Data de Nascimento
              TextFormField(
                decoration: InputDecoration(labelText: "Data de Nascimento"),
                validator:
                    (value) =>
                        value!.isEmpty ? "Informe a Data de Nascimento" : null,
                onSaved: (value) => _dataNascimento = value!,
              ),
              SizedBox(height: 20,),
              Text("Anos de Experiência"),
              //slider de Seleção  -> Experiência
              Slider(
                value: _experiencia,
                min: 0,
                max: 30,
                divisions: 30,
                label: _experiencia.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _experiencia = value;
                  });
                },
              ),
              //Aceite dos Termos de Uso
              CheckboxListTile(
                value: _aceite,
                title: Text("Aceito os Termos de Uso"),
                onChanged: (value) {
                  setState(() {
                    _aceite = value!;
                  });
                },
              ),
              ElevatedButton(
              onPressed: ()=> Navigator.pushNamed(context, "/"), 
              child: Text("Voltar")),
            //Criar a Validação dos Dados do formulários para mudar de tela
            ElevatedButton(
              onPressed: ()=> Navigator.pushNamed(context, "/confirmacao"), 
              child: Text("Enviar"))
            ],
          ),
        ),
      ),
    );
  }
}
