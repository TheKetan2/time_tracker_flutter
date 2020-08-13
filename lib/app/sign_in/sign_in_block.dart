import 'dart:async';

import 'package:time_tracker_flutter/services/auth.dart';
import 'package:flutter/foundation.dart';

class SignInBlock {
  final AuthBase auth;
  final StreamController<bool> _isLoadingController = StreamController<bool>();

  SignInBlock(this.auth);

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  // abstract class AuthBase {
  // Stream<User> get onAuthStateChanged;
  // Future<User> currentUser();

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      rethrow;
    } finally {
      _setIsLoading(false);
    }
  }

  Future<User> signInAnonymously() async =>
      await _signIn(auth.signInAnonymously);

  // Future<User> signInWithEmailAndPassword(String email, String password);
  // Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);
  // Future<User> signInWithFacebook();
//   Future<void> signOut();
// }
}
