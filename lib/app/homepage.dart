import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onSignOut;

  const HomePage({
    Key key,
    this.onSignOut,
  }) : super(key: key);

  Future<void> _signOut() async {
    print("Sign Out");
    try {
      await FirebaseAuth.instance.signOut();
      onSignOut();
      print("Sign Out");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        actions: <Widget>[
          FlatButton(
            onPressed: _signOut,
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
