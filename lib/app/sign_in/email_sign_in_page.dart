import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/sign_in/email_sign_in_form.dart';
// import 'package:time_tracker_flutter/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInFormStateful(),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
