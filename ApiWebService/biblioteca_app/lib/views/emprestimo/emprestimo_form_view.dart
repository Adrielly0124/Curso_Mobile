import 'package:flutter/material.dart';
import 'package:biblioteca_app/models/emprestimo.dart';
import 'package:biblioteca_app/models/livro.dart';
import 'package:biblioteca_app/controllers/emprestimo_controller.dart';
import 'package:biblioteca_app/controllers/livro_controller.dart';
import 'package:biblioteca_app/views/emprestimo/emprestimo_list_view.dart';

class EmprestimoFormView extends StatefulWidget {
  final Emprestimo? emprestimo;

  const EmprestimoFormView({super.key, this.emprestimo});

  @override
  State<EmprestimoFormView> createState() => _EmprestimoFormViewState();
}

class _EmprestimoFormViewState extends State<EmprestimoFormView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = EmprestimoController();
  final _livroController = LivroController();

  final _usuarioField = TextEditingController();
  final _dataDevolucaoField = TextEditingController();

  DateTime? _dataDevolucao;
  String? _livroSelecionado; // ID do livro escolhido
  List<Livro> _livrosDisponiveis = [];

  @override
  void initState() {
    super.initState();
    _carregarLivrosDisponiveis();

    if (widget.emprestimo != null) {
      _usuarioField.text = widget.emprestimo!.usuarioId ?? "";
      _livroSelecionado = widget.emprestimo!.livro;
      _dataDevolucao = widget.emprestimo!.dataDevolucao;
      _dataDevolucaoField.text =
          _dataDevolucao != null ? _dataDevolucao!.toIso8601String().split("T").first : "";
    }
  }

  Future<void> _carregarLivrosDisponiveis() async {
    try {
      final livros = await _livroController.fetchAll();
      setState(() {
        _livrosDisponiveis = livros.where((l) => l.disponivel).toList();
      });
    } catch (e) {
      // tratar erro (ex: snackbar)
    }
  }

  void _save() async {
    if (_formKey.currentState!.validate() && _livroSelecionado != null) {
      final emprestimo = Emprestimo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        usuarioId: _usuarioField.text.trim(),
        livro: _livroSelecionado!,
        dataEmprestimo: DateTime.now(),
        dataDevolucao: _dataDevolucao!,
        devolvido: false,
      );

      try {
        await _controller.create(emprestimo);
        // aqui você também poderia atualizar o livro para "disponivel = false"
      } catch (e) {
        // tratar erro
      }

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const EmprestimoListView()),
      );
    }
  }

  Future<void> _selecionarDataDevolucao() async {
    final hoje = DateTime.now();
    final novaData = await showDatePicker(
      context: context,
      initialDate: hoje.add(const Duration(days: 7)),
      firstDate: hoje,
      lastDate: DateTime(2100),
    );

    if (novaData != null) {
      setState(() {
        _dataDevolucao = novaData;
        _dataDevolucaoField.text = novaData.toIso8601String().split("T").first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.emprestimo == null
            ? "Novo Empréstimo"
            : "Editar Empréstimo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usuarioField,
                decoration: const InputDecoration(labelText: "Usuário (ID)"),
                validator: (value) =>
                    value!.isEmpty ? "Informe o ID do usuário" : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _livroSelecionado,
                items: _livrosDisponiveis.map((livro) {
                  return DropdownMenuItem(
                    value: livro.id,
                    child: Text("${livro.titulo} - ${livro.autor}"),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _livroSelecionado = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Livro Disponível",
                ),
                validator: (value) =>
                    value == null ? "Selecione um livro" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dataDevolucaoField,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Data de Devolução",
                  hintText: "AAAA-MM-DD",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: _selecionarDataDevolucao,
                validator: (value) =>
                    value!.isEmpty ? "Selecione a data de devolução" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _save,
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
