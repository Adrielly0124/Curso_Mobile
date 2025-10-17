class PontoModel {
  final String userId;
  final DateTime dataHora;
  final double latitude;
  final double longitude;

  PontoModel({
    required this.userId,
    required this.dataHora,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'dataHora': dataHora.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory PontoModel.fromMap(Map<String, dynamic> map) {
    return PontoModel(
      userId: map['userId'],
      dataHora: DateTime.parse(map['dataHora']),
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
