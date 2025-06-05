class MovimentacaoEstoque {
  int? id;
  int produtoId;
  String tipo; // 'entrada' ou 'saida'
  int quantidade;
  DateTime data;
  String observacao;

  MovimentacaoEstoque({
    this.id,
    required this.produtoId,
    required this.tipo,
    required this.quantidade,
    required this.data,
    required this.observacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'produto_id': produtoId,
      'tipo': tipo,
      'quantidade': quantidade,
      'data': data.toIso8601String(),
      'observacao': observacao,
    };
  }

  factory MovimentacaoEstoque.fromMap(Map<String, dynamic> map) {
    return MovimentacaoEstoque(
      id: map['id'],
      produtoId: map['produto_id'],
      tipo: map['tipo'],
      quantidade: map['quantidade'],
      data: DateTime.parse(map['data']),
      observacao: map['observacao'],
    );
  }
}