import 'package:shared_preferences/shared_preferences.dart';

class ServicoPreferencias {
  // Salva os dados usando shared_preferences
  static Future<void> salvarDados(String nome, String idade, String cor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', nome);
    await prefs.setString('idade', idade);
    await prefs.setString('cor', cor);
  }

  // Carrega os dados salvos
  static Future<Map<String, String>> carregarDados() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'nome': prefs.getString('nome') ?? '',
      'idade': prefs.getString('idade') ?? '',
      'cor': prefs.getString('cor') ?? 'Azul',
    };
  }
}