// classe para o controller dos usuário

import 'package:biblioteca_app/models/emprestimo.dart';
import 'package:biblioteca_app/services/api_service.dart';

class EmprestimoController {
  //métodos
  //Get do emprestimo
  Future<List<Emprestimo>> fetchAll() async{
    //pega a lista de usuario no formato List<dynamic>
    final list = await ApiService.getList("emprestimos?_sort=nome");
    //retornar a Lista de Usuários Convertidas
    return list.map((item)=>Emprestimo.fromJson(item)).toList();
  }
  //Get de um unico Emprestimo
  Future<Emprestimo> fetchOne(String id) async{
    final emprestimo = await ApiService.getOne("emprestimos", id);
    return Emprestimo.fromJson(emprestimo);
  }
  //Post -> Criar um Novo emprestimo
  Future<Emprestimo> create(Emprestimo loan) async{
    final created = await ApiService.post("emprestimos", loan.toJson());
    return Emprestimo.fromJson(created);
  }
  //Put -> Alterar um Emprestimo
  Future<Emprestimo> update(Emprestimo loan) async{
    final updated = await ApiService.put("usuario", loan.toJson(), loan.id!);
    return Emprestimo.fromJson(updated);
  }
  // Delete -> Deletar um Emprestimo
  Future<void> delete(String id) async{
    await ApiService.delete("emprestimos", id);
  }
}
