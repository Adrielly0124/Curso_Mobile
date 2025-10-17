import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/ponto_model.dart';

class PontoController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registrarPonto() async {
    // Verifica permissões de localização
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permissão de localização negada.');
      }
    }

    // Pega localização atual
    Position position = await Geolocator.getCurrentPosition();
    const double localLat = -22.570889;
    const double localLng = -47.403854;

    double distancia = Geolocator.distanceBetween(
      localLat,
      localLng,
      position.latitude,
      position.longitude,
    );

    if (distancia > 100) {
      throw Exception('Você está fora do raio de 100 metros do local de trabalho.');
    }

    // Usuário logado
    final user = _auth.currentUser;
    if (user == null) throw Exception("Usuário não autenticado.");

    // Modelo de ponto
    final ponto = PontoModel(
      userId: user.uid,
      dataHora: DateTime.now(),
      latitude: position.latitude,
      longitude: position.longitude,
    );

    // Salva no Firestore
    await _firestore.collection("pontos").add(ponto.toMap());
  }
}
