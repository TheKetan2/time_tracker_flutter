import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/custom_raised_buttons/sign_in_button.dart';

import '../custom_raised_buttons/custom_raised_button.dart';

class SignInPage extends StatelessWidget {
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
            height: 18.0,
          ),
          SignInButton(
            text: "Sign in with Google",
            color: Colors.white,
            onPressed: () {
              print("Google.");
            },
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: "Sign in Facebook",
            textColor: Colors.white,
            color: Color(0xff334d92),
            onPressed: () {
              print("Facebook.");
            },
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: "Sign in with Email",
            textColor: Colors.white,
            color: Colors.teal,
            onPressed: () {
              print("Facebook.");
            },
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
            },
          ),
        ],
      ),
    );
  }
}
