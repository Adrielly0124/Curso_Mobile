import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/produto.dart';
import '../models/movimentacao_estoque.dart';

class BancoDadosHelper {
  static final BancoDadosHelper _instancia = BancoDadosHelper._internal();
  factory BancoDadosHelper() => _instancia;
  BancoDadosHelper._internal();

  static Database? _banco;

  Future<Database> get banco async {
    if (_banco != null) return _banco!;
    _banco = await _inicializarBanco();
    return _banco!;
  }

  Future<Database> _inicializarBanco() async {
    final caminhoBanco = join(await getDatabasesPath(), 'estoque.db');
    return await openDatabase(
      caminhoBanco,
      version: 1,
      onCreate: _criarTabelas,
    );
  }

  Future<void> _criarTabelas(Database db, int version) async {
    await db.execute('''
      CREATE TABLE produtos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo TEXT,
        nome TEXT,
        descricao TEXT,
        preco_custo REAL,
        preco_venda REAL,
        quantidade INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE movimentacoes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        produto_id INTEGER,
        tipo TEXT,
        quantidade INTEGER,
        data TEXT,
        observacao TEXT,
        FOREIGN KEY (produto_id) REFERENCES produtos (id)
      )
    ''');
  }

  // Métodos para Produto
  Future<int> inserirProduto(Produto produto) async {
    final db = await banco;
    return await db.insert('produtos', produto.toMap());
  }

  Future<List<Produto>> listarProdutos() async {
    final db = await banco;
    final mapas = await db.query('produtos');
    return List.generate(mapas.length, (i) => Produto.fromMap(mapas[i]));
  }

  Future<int> atualizarProduto(Produto produto) async {
    final db = await banco;
    return await db.update(
      'produtos',
      produto.toMap(),
      where: 'id = ?',
      whereArgs: [produto.id],
    );
  }

  Future<int> deletarProduto(int id) async {
    final db = await banco;
    return await db.delete(
      'produtos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Métodos para MovimentacaoEstoque
  Future<int> inserirMovimentacao(MovimentacaoEstoque movimentacao) async {
    final db = await banco;
    return await db.insert('movimentacoes', movimentacao.toMap());
  }

  Future<List<MovimentacaoEstoque>> listarMovimentacoesPorProduto(int produtoId) async {
    final db = await banco;
    final mapas = await db.query(
      'movimentacoes',
      where: 'produto_id = ?',
      whereArgs: [produtoId],
      orderBy: 'data DESC',
    );
    return List.generate(mapas.length, (i) => MovimentacaoEstoque.fromMap(mapas[i]));
  }
}