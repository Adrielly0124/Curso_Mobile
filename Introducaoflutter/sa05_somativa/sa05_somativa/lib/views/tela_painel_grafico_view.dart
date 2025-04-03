import 'package:flutter/material.dart';

class PainelGrafico extends StatefulWidget {
  @override
  _StatePainelGrafico createState() => _StatePainelGrafico();
}

class _StatePainelGrafico extends State<PainelGrafico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard de Tarefas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _construirCartaoTarefa("Tarefas Pendentes", "12", Colors.orange),
            _construirCartaoTarefa("Tarefas Concluídas", "25", Colors.green),
            _construirCartaoTarefa("Prazos Próximos", "5", Colors.red),
            _construirCartaoTarefa("Total de Tarefas", "37", Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _construirCartaoTarefa(String titulo, String valor, Color cor) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: cor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              valor,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

