import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get userChanges => _auth.authStateChanges();

  Future<User?> login(String email, String password) async {
    if (!email.endsWith('@rhconnect.com.br')) {
      throw Exception('O e-mail deve conter @rhconnect.com.br');
    }
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<User?> register(String email, String password, String nif) async {
    if (!email.endsWith('@rhconnect.com.br')) {
      throw Exception('O e-mail deve conter @rhconnect.com.br');
    }
    UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await userCredential.user?.updateDisplayName(nif);
    return userCredential.user;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
