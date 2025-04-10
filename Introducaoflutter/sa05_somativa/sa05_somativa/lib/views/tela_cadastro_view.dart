// Importação do pacote Flutter para criar a interface do usuário
import 'package:flutter/material.dart';

// Classe principal da tela de cadastro
class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

// Classe de estado para gerenciar o estado do formulário de cadastro
class _TelaCadastroState extends State<TelaCadastro> {
  // Chave global para identificar o formulário e gerenciar seu estado
  final _formKey = GlobalKey<FormState>();

  // Atributos do formulário para armazenar os dados inseridos pelo usuário
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _genero = "";
  String _dataNascimento = "";
  bool _aceite = false; // Indica se o usuário aceitou os termos de uso

  // Método que constrói a interface do widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar no topo da tela
      appBar: AppBar(
        title: Text("Cadastro de Usuário"), // Título da AppBar
        centerTitle: true, // Centraliza o título
        backgroundColor: Color.fromARGB(223, 184, 0, 0), // Cor de fundo da AppBar
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20), // Estilo do título
      ),

      // Corpo principal da tela
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Espaçamento interno
        child: Form(
          key: _formKey, // Associa o formulário à chave global
          child: Column(
            children: [
              // Campo de texto para o nome
              TextFormField(
                decoration: InputDecoration(labelText: "Digite seu Nome"), // Rótulo do campo
                validator: (value) =>
                    value!.isEmpty ? "Campo não Preenchido!!!" : null, // Validação
                onSaved: (value) => _nome = value!, // Salva o valor no atributo _nome
              ),
              SizedBox(height: 20), // Espaçamento entre os campos

              // Campo de texto para o email
              TextFormField(
                decoration: InputDecoration(labelText: "Digite seu Email"), // Rótulo do campo
                validator: (value) =>
                    value!.contains("@") ? null : "Digite um e-mail válido", // Validação
                onSaved: (value) => _email = value!, // Salva o valor no atributo _email
              ),

              // Campo de texto para a senha
              TextFormField(
                decoration: InputDecoration(labelText: "Insira uma Senha"), // Rótulo do campo
                obscureText: true, // Oculta o texto para senhas
                validator: (value) =>
                    value!.length < 6 ? "Senha Fraca" : null, // Validação
                onSaved: (value) => _senha = value!, // Salva o valor no atributo _senha
              ),

              // Campo para selecionar o gênero
              Text("Gênero: "),
              DropdownButtonFormField(
                items: ["Masculino", "Feminino", "Outro"]
                    .map((String genero) => DropdownMenuItem(
                          value: genero,
                          child: Text(genero),
                        ))
                    .toList(), // Lista de opções
                onChanged: (value) {}, // Ação ao selecionar um item
                validator: (value) =>
                    value == null ? "Selecione um Gênero" : null, // Validação
                onSaved: (value) => _genero = value!, // Salva o valor no atributo _genero
              ),

              // Campo de texto para a data de nascimento
              TextFormField(
                decoration: InputDecoration(labelText: "Data de Nascimento"), // Rótulo do campo
                validator: (value) =>
                    value!.isEmpty ? "Informe a Data de Nascimento" : null, // Validação
                onSaved: (value) => _dataNascimento = value!, // Salva o valor no atributo _dataNascimento
              ),
              SizedBox(height: 20), // Espaçamento entre os campos

              // Checkbox para aceitar os termos de uso
              CheckboxListTile(
                value: _aceite, // Estado do checkbox
                title: Text("Aceito os Termos de Uso"), // Texto ao lado do checkbox
                onChanged: (value) {
                  setState(() {
                    _aceite = value!; // Atualiza o estado do checkbox
                  });
                },
              ),

              // Botão para enviar o formulário
              ElevatedButton(
                onPressed: _enviarFormulario, // Chama o método _enviarFormulario
                child: Text("Enviar"), // Texto do botão
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para validar e enviar o formulário
  void _enviarFormulario() {
    // Verifica se o formulário é válido e se os termos foram aceitos
    if (_formKey.currentState!.validate() && _aceite) {
      _formKey.currentState!.save(); // Salva os valores dos campos
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Dados do Formulário"), // Título do diálogo
          content: Column(
            mainAxisSize: MainAxisSize.min, // Ajusta o tamanho ao conteúdo
            children: [
              Text("Nome: $_nome"), // Exibe o nome
              Text("Email: $_email"), // Exibe o email
            ],
          ),
        ),
      );
    }
  }
}