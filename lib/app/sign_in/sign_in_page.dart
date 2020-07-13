import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 2.0,
      ),
      body: _buildContents(),
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
          // Text("Sign In"),
          Container(
            color: Colors.orange,
            width: 100.0,
            height: 100,
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            color: Colors.red,
            child: SizedBox(
              width: 100.0,
              height: 100,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            color: Colors.green,
            child: SizedBox(
              width: 100.0,
              height: 100,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
