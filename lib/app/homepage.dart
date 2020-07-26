import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/services/auth.dart';

class HomePage extends StatelessWidget {
  // final VoidCallback onSignOut;
  final AuthBase auth;

  const HomePage({
    Key key,
    @required this.auth,
  }) : super(key: key);

  Future<void> _signOut() async {
    print("Sign Out");
    try {
      await auth.signOut();
      // onSignOut();
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
