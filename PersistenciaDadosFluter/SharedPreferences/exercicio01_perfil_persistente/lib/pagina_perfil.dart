import 'package:flutter/material.dart';
import '/servico_preferencias.dart';

class PaginaPerfil extends StatefulWidget {
  @override
  _PaginaPerfilEstado createState() => _PaginaPerfilEstado();
}

class _PaginaPerfilEstado extends State<PaginaPerfil> {
  // Controladores para campos de texto
  final TextEditingController controladorNome = TextEditingController();
  final TextEditingController controladorIdade = TextEditingController();

  String corFavorita = 'Azul'; // Valor inicial da cor favorita

  // Mapeia nomes de cores para objetos Color reais
  final Map<String, Color> mapaCores = {
    'Vermelho': Colors.red,
    'Verde': Colors.green,
    'Azul': Colors.blue,
    'Amarelo': Colors.yellow,
    'Roxo': Colors.purple,
  };

  // Dados salvos
  String nomeSalvo = '';
  String idadeSalva = '';
  String corSalva = '';
  Color corDeFundo = Colors.blue;

  @override
  void initState() {
    super.initState();
    carregarDados(); // Carrega dados ao iniciar a tela
  }

  // Carrega dados salvos usando o serviço
  Future<void> carregarDados() async {
    final dados = await ServicoPreferencias.carregarDados();
    setState(() {
      nomeSalvo = dados['nome'] ?? '';
      idadeSalva = dados['idade'] ?? '';
      corSalva = dados['cor'] ?? 'Azul';
      corDeFundo = mapaCores[corSalva] ?? Colors.blue;
    });
  }

  // Salva os dados informados
  Future<void> salvarDados() async {
    await ServicoPreferencias.salvarDados(
      controladorNome.text,
      controladorIdade.text,
      corFavorita,
    );

    setState(() {
      nomeSalvo = controladorNome.text;
      idadeSalva = controladorIdade.text;
      corSalva = corFavorita;
      corDeFundo = mapaCores[corFavorita] ?? Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corDeFundo, // Cor do fundo com base na cor favorita
      appBar: AppBar(
        title: Text('Meu Perfil'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controladorNome,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: controladorIdade,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: corFavorita,
              items: mapaCores.keys.map((String cor) {
                return DropdownMenuItem<String>(
                  value: cor,
                  child: Text(cor),
                );
              }).toList(),
              onChanged: (String? novaCor) {
                setState(() {
                  corFavorita = novaCor!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: salvarDados,
              child: Text('Salvar Dados'),
            ),
            SizedBox(height: 30),
            Text('Dados Salvos:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Nome: $nomeSalvo'),
            Text('Idade: $idadeSalva'),
            Text('Cor Favorita: $corSalva'),
          ],
        ),
      ),
    );
  }
}