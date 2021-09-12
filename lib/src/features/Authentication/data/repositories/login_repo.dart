import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class LoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> authenticate({
    @required String email,
    @required String password,
  }) async {
    User user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      if (user != null) {
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided.');
      }
    }
  }

  // Future<void> deleteToken() async {
  //   /// delete from keystore/keychain
  //   await Future.delayed(Duration(seconds: 1));
  //   return;
  // }

  // Future<void> persistToken(String token) async {
  //   /// write to keystore/keychain
  //   await Future.delayed(Duration(seconds: 1));
  //   return;
  // }

  // Future<bool> hasToken() async {
  //   /// read from keystore/keychain
  //   await Future.delayed(Duration(seconds: 1));
  //   return false;
  // }
}
