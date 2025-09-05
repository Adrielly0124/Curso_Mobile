import 'package:biblioteca_app/controllers/livro_controller.dart';
import 'package:biblioteca_app/models/livro.dart';
import 'package:biblioteca_app/views/livro/livro_form_view.dart';
import 'package:flutter/material.dart';

class LivroListView extends StatefulWidget {
  const LivroListView({super.key});

  @override
  State<LivroListView> createState() => _LivroListViewState();
}

class _LivroListViewState extends State<LivroListView> {
  final _controller = LivroController();
  List<Livro> _livros = [];
  List<Livro> _filtroLivros = [];
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
      _livros = await _controller.fetchAll();
      _filtroLivros = _livros;
    } catch (e) {
      // tratar erro
    }
    setState(() => _loading = false);
  }

  void _filtrar() {
    final busca = _buscaField.text.toLowerCase();
    setState(() {
      _filtroLivros = _livros.where((livro) {
        return livro.titulo.toLowerCase().contains(busca) ||
            livro.autor.toLowerCase().contains(busca);
      }).toList();
    });
  }

  void _openForm({Livro? livro}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LivroFormView(livro: livro),
      ),
    );
    _load();
  }

  void _delete(Livro livro) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirma Exclusão"),
        content: Text("Deseja realmente excluir o livro '${livro.titulo}'?"),
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
        await _controller.delete(livro.id!);
        _load();
      } catch (e) {
        // tratar erro
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Livros")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _buscaField,
                    decoration:
                        const InputDecoration(labelText: "Pesquisar Livro"),
                    onChanged: (value) => _filtrar(),
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filtroLivros.length,
                      itemBuilder: (context, index) {
                        final livro = _filtroLivros[index];
                        return Card(
                          child: ListTile(
                            title: Text(livro.titulo),
                            subtitle: Text(
                                "Autor: ${livro.autor}\nDisponível: ${livro.disponivel ? "Sim" : "Não"}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () => _openForm(livro: livro),
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () => _delete(livro),
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
