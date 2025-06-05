import '../models/produto.dart';
import '../models/movimentacao_estoque.dart';
import '../services/estoque_dbhelper.dart';

class ControladorProduto {
  final BancoDadosHelper _bancoHelper = BancoDadosHelper();

  Future<void> adicionarProduto(Produto produto) async {
    await _bancoHelper.inserirProduto(produto);
  }

  Future<List<Produto>> obterProdutos() async {
    return await _bancoHelper.listarProdutos();
  }

  Future<void> registrarMovimentacao(MovimentacaoEstoque movimentacao) async {
    await _bancoHelper.inserirMovimentacao(movimentacao);
    final produtos = await _bancoHelper.listarProdutos();
    final produto = produtos.firstWhere((p) => p.id == movimentacao.produtoId);
    if (movimentacao.tipo == 'entrada') {
      produto.quantidade += movimentacao.quantidade;
    } else {
      produto.quantidade -= movimentacao.quantidade;
    }
    await _bancoHelper.atualizarProduto(produto);
  }

  Future<List<MovimentacaoEstoque>> obterMovimentacoes(int produtoId) async {
    return await _bancoHelper.listarMovimentacoesPorProduto(produtoId);
  }
}