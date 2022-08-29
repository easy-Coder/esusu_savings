import 'package:esusu_savings/constant/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:esusu_savings/constant/error/error.dart';

class AuthRepositry {
  final FirebaseAuth _firebaseAuth;

  AuthRepositry(this._firebaseAuth);

  Stream<User?> get userAuthChanges => _firebaseAuth.userChanges();

  User? get user => _firebaseAuth.currentUser;

  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      throw CustomException(message: error.message!);
    }
  }

  Future<void> createUser(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      throw CustomException(message: error.message!);
    }
  }
}



final authRepositryProvider = Provider<AuthRepositry>((ref) {
  return AuthRepositry(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositryProvider).userAuthChanges;
});
