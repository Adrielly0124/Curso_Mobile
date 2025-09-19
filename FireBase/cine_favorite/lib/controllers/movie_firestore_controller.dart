//gerencia o relacionamento do modelo 

import 'dart:io';

import 'package:cine_favorite/models/movie_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class MovieFirestoreController {
  //atributos
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  //criar método para pegar o usuário loogado
  User? get currentUser => _auth.currentUser;

  //método para pegar os filmas da coleção de favoritos
  //Stream => criar um ouvinte (listener => pegar a lista de favoritos, sempre que for modificada)
  Stream<List<Movie>> getFavoriteMovies(){
    if (currentUser == null) return Stream.value([]);//retorna a lista vazia caso usuário seja null
    return _db
    .collection("usuarios")
    .doc(currentUser!.uid)
    .collection("favorite_movies")
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) =>Movie.fromMap(doc.data())).toList());
    //retorna a coleção que estava em JSON => convertida para Objs de uma Lista de Filmes

  }

  //path e path_provider (bibliotecas que permitem acesso as pastas do dispositivos)
  //adicionar um filme a lista de favoritos
  void addFavoriteMovie(Map<String, dynamic> movieData) async{
    //verificar se o filme tem poster (imagem de capa)
    if(movieData["poster_path"] == null) return; //se o filme não tiver caá nao continua

    //vamos armazenar a capa do flme no dispositivo
    //baixando a imagem da internet
    final imageUrl = "https://image.tmdb.otg/t/p/w500${movieData["poster_path"]}";
    final responseImg = await http.get(Uri.parse(imageUrl));

    //armazenar a imagem no diretório do apliacativo
    final imgDir = await getApplicationDocumentsDirectory();
    final file = File("${imgDir.path}/${movieData["id"]}.jpg"); //baixando a imagem para o aplicativo
    await file.writeAsBytes(responseImg.bodyBytes);

    //criar o Obj do filme
    final movie = Movie(
      id: movieData["id"] , 
      title: movieData["title"], 
      posterPath: file.toString());

      //adicionar o filme no firestore
      await _db
      .collection("usuarios")
      .doc(currentUser!.uid)
      .collection("favorite_movies")
      .doc(movie.id.toString())
      .set(movie.toMap());
  }

  //delete

  //update (modificar a nota)
}