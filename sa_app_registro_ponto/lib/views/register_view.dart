import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nifController = TextEditingController();
  final _authController = AuthController();

  bool _loading = false;

  void _register() async {
    setState(() => _loading = true);
    try {
      await _authController.register(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _nifController.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Conta criada com sucesso!')));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginView()));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nifController, decoration: const InputDecoration(labelText: 'NIF')),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'E-mail (@rhconnect.com.br)')),
            TextField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'Senha')),
            const SizedBox(height: 16),
            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: _register, child: const Text('Cadastrar')),
          ],
        ),
      ),
    );
  }
}
