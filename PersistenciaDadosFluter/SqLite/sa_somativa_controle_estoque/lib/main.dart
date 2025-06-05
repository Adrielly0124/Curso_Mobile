import 'package:flutter/material.dart';
import 'controllers/controlador_produto.dart';
import 'view/lista_produtos.dart';

void main() {
  runApp(AplicativoEstoque());
}

class AplicativoEstoque extends StatelessWidget {
  final ControladorProduto controlador = ControladorProduto();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Estoque',
      home: ListaProdutos(controlador: controlador),
    );
  }
}