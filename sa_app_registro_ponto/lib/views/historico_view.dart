import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoricoView extends StatelessWidget {
  const HistoricoView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico de Pontos"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("pontos")
            .where("userId", isEqualTo: user?.uid)
            .orderBy("dataHora", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Nenhum ponto registrado ainda."));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final date = (data["dataHora"] as Timestamp).toDate();

              return ListTile(
                leading: const Icon(Icons.access_time),
                title: Text("Data/Hora: ${date.toString()}"),
                subtitle: Text(
                    "Lat: ${data["latitude"]}, Lng: ${data["longitude"]}"),
              );
            },
          );
        },
      ),
    );
  }
}
