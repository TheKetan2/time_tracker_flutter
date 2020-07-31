import 'package:flutter/material.dart';

import 'package:time_tracker_flutter/app/custom_raised_buttons/sign_in_button.dart';
import 'package:time_tracker_flutter/app/custom_raised_buttons/social_sign_in_button.dart';
import 'package:time_tracker_flutter/app/services/auth.dart';

class SignInPage extends StatelessWidget {
  final AuthBase auth;

  const SignInPage({
    Key key,
    @required this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 2.0,
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Future<void> _signInAnnonymously() async {
    try {
      await auth.signInAnnonymously();
      // print("${authResult.user.uid}");
      // onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    //TODO: show email of user
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
      // print("${authResult.user.uid}");
      // onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Widget _buildContents() {
    return Padding(
      // width: double.infinity,
      // color: Colors.yellow,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Sign In",
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            color: Colors.white,
            textColor: Colors.black87,
            text: "Sign in with Google",
            assetName: "img/google-logo.png",
            onPressed: _signInWithGoogle,
          ),
          // SizedBox(
          //   height: 8.0,
          // ),
          // SocialSignInButton(
          //   color: Color(0xff334d92),
          //   textColor: Colors.white,
          //   text: "Sign in with Facebook",
          //   assetName: "img/facebook-logo.png",
          //   onPressed: () {},
          // ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: "Sign in with email",
            color: Colors.teal[700],
            textColor: Colors.white,
            onPressed: () => {},
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "OR",
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: "Go Annonymous",
            textColor: Colors.black87,
            color: Colors.lime[300],
            onPressed: () {
              print("Facebook.");
              _signInAnnonymously();
            },
          ),
        ],
      ),
    );
  }
}
