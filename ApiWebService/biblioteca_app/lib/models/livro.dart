class Usuario {
  //atributos
  final String? id;//pode ser nulo inicialmente
  final String titulo;
  final String autor;
  final bool disponivel;

  Usuario({this.id, required this.titulo , required this.autor, required this.disponivel});

  //metodos
  //toJson
  Map<String,dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "autor": autor,
    "disponivel": disponivel,
  };

  //fromMap
  factory Usuario.fromJson(Map<String,dynamic> Json) =>
  Usuario(
    id: Json["id"].tostring(),
    titulo: Json["nome"].tostring(),
    autor: Json["email"].tostring(),
    disponivel: Json["disponivel"] == true ? true : false,
  );
}