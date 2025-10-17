class UserModel {
  final String uid;
  final String nif;
  final String email;

  UserModel({required this.uid, required this.nif, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nif': nif,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      nif: map['nif'],
      email: map['email'],
    );
  }
}
