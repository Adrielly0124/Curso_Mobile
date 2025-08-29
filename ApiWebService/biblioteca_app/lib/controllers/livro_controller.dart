// classe para o controller dos usuário

import 'package:biblioteca_app/models/livro.dart';
import 'package:biblioteca_app/services/api_service.dart';

class LivroController {
  //métodos
  //Get do livro
  Future<List<Livro>> fetchAll() async{
    //pega a lista de usuario no formato List<dynamic>
    final list = await ApiService.getList("livros?_sort=nome");
    //retornar a Lista de Usuários Convertidas
    return list.map((item)=>Livro.fromJson(item)).toList();
  }
  //Get de um unico Livro
  Future<Livro> fetchOne(String id) async{
    final livro = await ApiService.getOne("livros", id);
    return Livro.fromJson(livro);
  }
  //Post -> Criar um Novo livro
  Future<Livro> create(Livro book) async{
    final created = await ApiService.post("livros", book.toJson());
    return Livro.fromJson(created);
  }
  //Put -> Alterar um Livro
  Future<Livro> update(Livro book) async{
    final updated = await ApiService.put("livro", book.toJson(), book.id!);
    return Livro.fromJson(updated);
  }
  // Delete -> Deletar um Livro
  Future<void> delete(String id) async{
    await ApiService.delete("livros", id);
  }
}
