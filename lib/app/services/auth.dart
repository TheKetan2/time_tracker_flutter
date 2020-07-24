import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<FirebaseUser> currentUser() async {
    return await FirebaseAuth.instance.currentUser();
  }

  Future<FirebaseUser> signInAnnonymously() async {
    try {
      AuthResult authResult = await FirebaseAuth.instance.signInAnonymously();
      return authResult.user;
    } catch (e) {
      print("Error: " + e);
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }
}
