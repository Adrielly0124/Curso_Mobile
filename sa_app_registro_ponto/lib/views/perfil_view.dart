import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: user == null
            ? const Center(child: Text('Nenhum usuário logado'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NIF: ${user.displayName ?? 'Não informado'}'),
                  Text('E-mail: ${user.email}'),
                ],
              ),
      ),
    );
  }
}
