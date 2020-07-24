import "package:flutter/material.dart";
import 'package:time_tracker_flutter/app/services/auth.dart';
import 'package:time_tracker_flutter/app/sign_in/landing_page.dart';
// import 'package:time_tracker_flutter/app/sign_in/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthBase auth;

  const MyApp({Key key, this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Time Tracker",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
