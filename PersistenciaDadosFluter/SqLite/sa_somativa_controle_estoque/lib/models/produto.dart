class Produto {
  int? id;
  String codigo;
  String nome;
  String descricao;
  double precoCusto;
  double precoVenda;
  int quantidade;

  Produto({
    this.id,
    required this.codigo,
    required this.nome,
    required this.descricao,
    required this.precoCusto,
    required this.precoVenda,
    required this.quantidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigo': codigo,
      'nome': nome,
      'descricao': descricao,
      'preco_custo': precoCusto,
      'preco_venda': precoVenda,
      'quantidade': quantidade,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      codigo: map['codigo'],
      nome: map['nome'],
      descricao: map['descricao'],
      precoCusto: map['preco_custo'],
      precoVenda: map['preco_venda'],
      quantidade: map['quantidade'],
    );
  }
}