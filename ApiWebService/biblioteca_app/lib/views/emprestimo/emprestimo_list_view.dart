import 'package:biblioteca_app/controllers/emprestimo_controller.dart';
import 'package:biblioteca_app/models/emprestimo.dart';
import 'package:biblioteca_app/views/emprestimo/emprestimo_form_view.dart';
import 'package:flutter/material.dart';

class EmprestimoListView extends StatefulWidget {
  const EmprestimoListView({super.key});

  @override
  State<EmprestimoListView> createState() => _EmprestimoListViewState();
}

class _EmprestimoListViewState extends State<EmprestimoListView> {
  final _controller = EmprestimoController();
  List<Emprestimo> _emprestimos = [];
  List<Emprestimo> _filtroEmprestimos = [];
  bool _loading = true;
  final _buscaField = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    setState(() => _loading = true);
    try {
      _emprestimos = await _controller.fetchAll();
      _filtroEmprestimos = _emprestimos;
    } catch (e) {
      // Tratar erro
    }
    setState(() => _loading = false);
  }

  void _filtrar() {
    final busca = _buscaField.text.toLowerCase();
    setState(() {
      _filtroEmprestimos = _emprestimos.where((emp) {
        return emp.usuarioId.toLowerCase().contains(busca) ||
            emp.livro.toLowerCase().contains(busca);
      }).toList();
    });
  }

  void _openForm({Emprestimo? emprestimo}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmprestimoFormView(emprestimo: emprestimo),
      ),
    );
    _load();
  }

  void _delete(Emprestimo emprestimo) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirma Exclusão"),
        content: Text(
            "Deseja realmente excluir o empréstimo do livro '${emprestimo.livro}'?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancelar")),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Excluir")),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await _controller.delete(emprestimo.id);
        _load();
      } catch (e) {
        // Tratar erro
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Empréstimos"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _buscaField,
                    decoration: const InputDecoration(
                        labelText: "Pesquisar Empréstimo"),
                    onChanged: (value) => _filtrar(),
                  ),
                  const Divider(),
                  Expanded(
                    child: _filtroEmprestimos.isEmpty
                        ? const Center(
                            child: Text("Nenhum empréstimo encontrado"))
                        : ListView.builder(
                            itemCount: _filtroEmprestimos.length,
                            itemBuilder: (context, index) {
                              final emp = _filtroEmprestimos[index];
                              return Card(
                                child: ListTile(
                                  title: Text(emp.livro),
                                  subtitle: Text(
                                      "Usuário: ${emp.usuarioId}\nDevolução: ${emp.dataDevolucao.toLocal().toString().split(' ')[0]}"),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () =>
                                              _openForm(emprestimo: emp),
                                          icon: const Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () => _delete(emp),
                                          icon: const Icon(Icons.delete,
                                              color: Colors.red)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}