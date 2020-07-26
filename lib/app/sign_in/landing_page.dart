import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/homepage.dart';
import 'package:time_tracker_flutter/app/services/auth.dart';
import 'package:time_tracker_flutter/app/sign_in/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;

  const LandingPage({
    Key key,
    this.auth,
  }) : super(key: key);

  // @override
  // void initState() {
  //   // Todo: this method must be synchronous
  //   _checkCurrentUser();
  //   super.initState();
  //   widget.auth.onAuthStateChanged.listen((user) {
  //     print("user: ${user?.uid}");
  //   });
  // }

  // Future<void> _checkCurrentUser() async {
  //   User user = await widget.auth.currentUser();
  //   print(user);
  //   _updateUser(user);
  // }

  // void _updateUser(User user) {
  //   print(user);
  //   setState(() {
  //     _user = user;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data;

          if (user == null) {
            return SignInPage(
              auth: auth,
            );
          }

          return HomePage(
            auth: auth,
          );
        } else {
          print("hasdata: ${snapshot.hasData}");
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
