import 'package:biblioteca_app/controllers/livro_controller.dart';
import 'package:biblioteca_app/models/livro.dart';
import 'package:biblioteca_app/views/livro/livro_list_view.dart';
import 'package:flutter/material.dart';

class LivroFormView extends StatefulWidget {
  final Livro? livro;

  const LivroFormView({super.key, this.livro});

  @override
  State<LivroFormView> createState() => _LivroFormViewState();
}

class _LivroFormViewState extends State<LivroFormView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = LivroController();

  final _tituloField = TextEditingController();
  final _autorField = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.livro != null) {
      _tituloField.text = widget.livro!.titulo;
      _autorField.text = widget.livro!.autor;
    }
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final livro = Livro(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        titulo: _tituloField.text.trim(),
        autor: _autorField.text.trim(),
        disponivel: true, // sempre disponível ao cadastrar
      );

      try {
        await _controller.create(livro);
      } catch (e) {
        // tratar erro
      }

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LivroListView()),
      );
    }
  }

  void _update() async {
    if (_formKey.currentState!.validate()) {
      final livro = Livro(
        id: widget.livro!.id,
        titulo: _tituloField.text.trim(),
        autor: _autorField.text.trim(),
        disponivel: widget.livro!.disponivel, // mantém estado atual
      );

      try {
        await _controller.update(livro);
      } catch (e) {
        // tratar erro
      }

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LivroListView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.livro == null ? "Novo Livro" : "Editar Livro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloField,
                decoration: const InputDecoration(labelText: "Título"),
                validator: (value) =>
                    value!.isEmpty ? "Informe o título do livro" : null,
              ),
              TextFormField(
                controller: _autorField,
                decoration: const InputDecoration(labelText: "Autor"),
                validator: (value) =>
                    value!.isEmpty ? "Informe o autor do livro" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: widget.livro == null ? _save : _update,
                child: Text(widget.livro == null ? "Salvar" : "Atualizar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
