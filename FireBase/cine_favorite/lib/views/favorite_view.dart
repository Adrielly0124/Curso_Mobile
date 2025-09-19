import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Favoritos"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // aqui você pode chamar FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: const Center(
        child: Text("Lista de favoritos"),
      ),
    );
  }
}