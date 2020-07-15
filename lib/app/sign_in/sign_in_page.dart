import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/custom_raised_buttons/sign_in_button.dart';
import 'package:time_tracker_flutter/app/custom_raised_buttons/social_sign_in_button.dart';

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
          CustomRaisedButton(
            color: Colors.white,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset("img/google-logo.png"),
                Text("Sign in with Google"),
                Container()
              ],
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          SocialSignInButton(
            color: Color(0xff334d92),
            textColor: Colors.white,
            text: "Sign in with Facebook",
            assetName: "img/facebook-logo.png",
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
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
