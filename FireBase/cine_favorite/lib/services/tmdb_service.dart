import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

//meu serviçp de conexão com a API

class TmdbService{
  //colocar os dados da API
  static const String _apiKey = "https://api.themoviedb.org/3/movie/popular?api_key=1fa5c2d59029fd1c438cc35713720604&language=pt-BR //static é um atributo específico da classe";
  static const String _baseURL = "https://api.themoviedb.org/3";
  static const String _idioma = "pt-BR";

  //método para buscar filme com base no texto 

  static  Future<List<Map<String, dynamic>>> searchMovies(String query) async{
    //converter String em URL
    final apiURL = Uri.parse("$_baseURL/search/movie?api_key=$_apiKey&query=$query&language=$_idioma");
    //http.get
    final response = await http.get(apiURL);

    //se resposta for ok == 200
    if(response.statusCode ==200){
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data["results"]);
    }else{
      //caso contrário cria uma exception
      throw Exception("Falha ao Carregar Filmes da API");
    }
  }

  //método de busca de filme pelo ID
}