import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../controllers/ponto_controller.dart';
import 'perfil_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthController();
    final pontoController = PontoController();

    Future<void> registrarPonto() async {
      try {
        final user = auth.userChanges.first;
        final u = await user;
        if (u == null) return;
        await pontoController.registrarPonto(u.uid);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ponto registrado com sucesso!')));
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

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
      body: Center(
        child: ElevatedButton(
          onPressed: registrarPonto,
          child: const Text('Registrar Ponto'),
        ),
      ),
    );
  }
}
