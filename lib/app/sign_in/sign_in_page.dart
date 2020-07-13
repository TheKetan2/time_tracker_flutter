import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 2.0,
      ),
      body: buildContents(),
    );
  }

  Widget buildContents() {
    return Container(
      width: double.infinity,
      color: Colors.yellow,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.orange,
            width: 100.0,
            height: 100,
          ),
          Container(
            color: Colors.white,
            child: SizedBox(
              width: 100.0,
              height: 100,
            ),
          ),
          Container(
            color: Colors.green,
            child: SizedBox(
              width: 100.0,
              height: 100,
            ),
          ),
          Text("Sign In"),
        ],
      ),
    );
  }
}
