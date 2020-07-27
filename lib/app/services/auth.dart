import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  final String uid;

  User({@required this.uid});
}

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signInAnnonymously();
  Future<void> signOut();
  Stream<User> get onAuthStateChanged;
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) return null;
    return User(
      uid: user.uid,
    );
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(
      _userFromFirebase,
    );
  }

  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<User> signInAnnonymously() async {
    try {
      AuthResult authResult = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print("Error: " + e);
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<User> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;

      final authResult = await _firebaseAuth.signInWithCredential(
        GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ),
      );

      return _userFromFirebase(authResult.user);
    } else {
      throw PlatformException(
        code: "ERROR_ABORTED_BY_USER",
        message: "SIGN IN ABORTED",
      );
    }
  }
}
