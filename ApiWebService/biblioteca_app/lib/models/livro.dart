class Livro {
  //atributos
  final String? id;//pode ser nulo inicialmente
  final String titulo;
  final String autor;
  final bool disponivel;

  Livro({this.id, required this.titulo , required this.autor, required this.disponivel});

  //metodos
  //toJson
  Map<String,dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "autor": autor,
    "disponivel": disponivel,
  };

  //fromMap
  factory Livro.fromJson(Map<String,dynamic> Json) =>
  Livro(
    id: Json["id"].tostring(),
    titulo: Json["nome"].tostring(),
    autor: Json["email"].tostring(),
    disponivel: Json["disponivel"] == 1 ? true : false,
  );

  static fromMap(item) {}
}