class Livro {
  // atributos
  final String? id;
  final String titulo;
  final String autor;
  final bool disponivel;

  Livro({
    this.id,
    required this.titulo,
    required this.autor,
    this.disponivel = true, // por padrão, um livro novo está disponível
  });

  // converte para JSON (salvar no banco/localStorage)
  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "autor": autor,
        "disponivel": disponivel,
      };

  // cria a partir de JSON (carregar do banco/localStorage)
  factory Livro.fromJson(Map<String, dynamic> json) => Livro(
        id: json["id"]?.toString(),
        titulo: json["titulo"] ?? "",
        autor: json["autor"] ?? "",
        disponivel: json["disponivel"] is bool
            ? json["disponivel"]
            : json["disponivel"] == 1, // suporta bool ou int
      );

  // caso queira usar em SQLite (Map<String, dynamic>)
  factory Livro.fromMap(Map<String, dynamic> map) => Livro(
        id: map["id"]?.toString(),
        titulo: map["titulo"] ?? "",
        autor: map["autor"] ?? "",
        disponivel: map["disponivel"] == 1,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "autor": autor,
        "disponivel": disponivel ? 1 : 0,
      };
}