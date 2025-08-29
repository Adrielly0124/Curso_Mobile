class Emprestimo {
  //atributos
  final String? usuario_id;//pode ser nulo inicialmente
  final String livro;
  final DateTime data_emprestimo;
  final DateTime data_devolucao;
  final bool devolvido;

  Emprestimo({this.usuario_id, required this.livro , required this.data_emprestimo, required this.data_devolucao, required this.devolvido});

  //metodos
  //toJson
  Map<String,dynamic> toJson() => {
    "id": usuario_id,
    "titulo": livro,
    "autor": data_emprestimo,
    "disponivel": data_devolucao,
  };

  //fromMap
  factory Emprestimo.fromJson(Map<String,dynamic> Json) =>
  Emprestimo(
    usuario_id: Json["id"].tostring(),
    livro: Json["nome"].tostring(),
    data_emprestimo: Json["email"].tostring(),
    data_devolucao: DateTime.parse(Json["data_devolucao"]), devolvido:  Json["devolvido"] == true ? true : false,
  );

  get id => null;
}

