import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/homepage.dart';
import 'package:time_tracker_flutter/app/services/auth.dart';
import 'package:time_tracker_flutter/app/services/auth_provider.dart';
import 'package:time_tracker_flutter/app/sign_in/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;

          if (user == null) {
            return SignInPage();
          }

          return HomePage();
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
