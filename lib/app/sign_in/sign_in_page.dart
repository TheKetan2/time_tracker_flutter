import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey,
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
          SizedBox(
            height: 8.0,
          ),
          CustomRaisedButton(
            child: Text(
              "Sign in with Google",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            onPressed: () {
              print("Google.");
            },
          ),
          CustomRaisedButton(
            child: Text(
              "Sign in with Facebook",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            onPressed: () {
              print("Facebook.");
            },
          )
        ],
      ),
    );
  }
}
