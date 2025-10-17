import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import '../models/ponto_model.dart';

class PontoController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> registrarPonto(String userId) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permissão de localização negada.');
      }
    }
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

    PontoModel ponto = PontoModel(
      userId: userId,
      dataHora: DateTime.now(),
      latitude: position.latitude,
      longitude: position.longitude,
    );

    await _firestore.collection('registros_ponto').add(ponto.toMap());
    return true;
  }
}
