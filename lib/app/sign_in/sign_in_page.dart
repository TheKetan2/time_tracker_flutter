import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 2.0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.yellow,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100,
              color: Colors.orange,
              child: SizedBox(),
            ),
            Container(
              width: 100.0,
              height: 100,
              color: Colors.green,
              child: SizedBox(),
            ),
            Text("Sign In"),
          ],
        ),
      ),
    );
  }
}
