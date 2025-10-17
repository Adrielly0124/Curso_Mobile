import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../controllers/ponto_controller.dart';
import 'perfil_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final auth = AuthController();
  final pontoController = PontoController();

  List<Map<String, dynamic>> historico = [];

  @override
  void initState() {
    super.initState();
    carregarHistorico();
  }

  Future<void> carregarHistorico() async {
    final user = await auth.userChanges.first;
    if (user == null) return;
    final pontos = await pontoController.getHistorico(user.uid);
    setState(() {
      historico = pontos;
    });
  }

  Future<void> registrarPonto() async {
    try {
      final user = await auth.userChanges.first;
      if (user == null) return;

      await pontoController.registrarPonto(user.uid);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ponto registrado com sucesso!')));

      // Atualiza o histórico após registrar
      await carregarHistorico();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Ponto'),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ProfileView())),
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () async => await auth.logout(),
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: registrarPonto,
              child: const Text('Registrar Ponto'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: historico.isEmpty
                  ? const Center(child: Text('Nenhum ponto registrado ainda.'))
                  : ListView.builder(
                      itemCount: historico.length,
                      itemBuilder: (context, index) {
                        final ponto = historico[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.access_time),
                            title: Text(ponto['dataHora'] ?? 'Sem data'),
                            subtitle: Text(ponto['localizacao'] ?? 'Sem localização'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
