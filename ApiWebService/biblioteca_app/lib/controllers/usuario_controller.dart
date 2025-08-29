// classe para o controller dos usuário

import 'package:biblioteca_app/models/usuario.dart';
import 'package:biblioteca_app/services/api_service.dart';

class UsuarioController {
  //métodos
  //Get do usuário
  Future<List<Usuario>> fetchAll() async{
    //pega a lista de usuario no formato List<dynamic>
    final list = await ApiService.getList("usuarios?_sort=nome");
    //retornar a Lista de Usuários Convertidas
    return list.map((item)=>Usuario.fromJson(item)).toList();
  }
  //Get de um unico Usuário
  Future<Usuario> fetchOne(String id) async{
    final usuario = await ApiService.getOne("usuarios", id);
    return Usuario.fromJson(usuario);
  }
  //Post -> Criar um Novo usuário
  Future<Usuario> create(Usuario user) async{
    final created = await ApiService.post("usuarios", user.toJson());
    return Usuario.fromJson(created);
  }
  //Put -> Alterar um Usuário
  Future<Usuario> update(Usuario user) async{
    final updated = await ApiService.put("usuarios", user.toJson(), user.id!);
    return Usuario.fromJson(updated);
  }
  // Delete -> Deletar um Usuário
  Future<void> delete(String id) async{
    await ApiService.delete("usuarios", id);
  }
}
