import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/homepage.dart';
import 'package:time_tracker_flutter/app/sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FirebaseUser _user;
  void _updateUser(FirebaseUser user) {
    print(user.uid);
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _user == null
        ? SignInPage(
            onSignIn: _updateUser,
          )
        : HomePage();
  }
}
