class Emprestimo {
  // Atributos
  final String id;              // identificador único
  final String usuarioId;       // id do usuário que pegou o livro
  final String livro;           // título ou id do livro
  final DateTime dataEmprestimo; // pega automaticamente a data atual
  final DateTime dataDevolucao;  // informado pelo usuário
  final bool devolvido;         // controle de devolução

  Emprestimo({
    required this.id,
    required this.usuarioId,
    required this.livro,
    required this.dataEmprestimo,
    required this.dataDevolucao,
    this.devolvido = false,
  });

  // Converte para JSON (salvar no banco/localStorage)
  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario_id": usuarioId,
        "livro": livro,
        "data_emprestimo": dataEmprestimo.toIso8601String(),
        "data_devolucao": dataDevolucao.toIso8601String(),
        "devolvido": devolvido,
      };

  // Construtor para criar a partir de JSON (carregar do banco/localStorage)
  factory Emprestimo.fromJson(Map<String, dynamic> json) => Emprestimo(
        id: json["id"] ?? "",
        usuarioId: json["usuario_id"] ?? "",
        livro: json["livro"] ?? "",
        dataEmprestimo: DateTime.parse(json["data_emprestimo"]),
        dataDevolucao: DateTime.parse(json["data_devolucao"]),
        devolvido: json["devolvido"] == true,
      );
}
