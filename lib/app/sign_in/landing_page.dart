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

  @override
  void initState() async {
    // TODO: implement initState

    super.initState();
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
  }

  void _updateUser(FirebaseUser user) {
    print(user);
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
        : HomePage(
            onSignOut: () => _updateUser(null),
          );
  }
}
