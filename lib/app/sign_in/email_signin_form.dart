import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/custom_raised_buttons/form_custom_raised_button.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "username@email.com",
        ),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        decoration: InputDecoration(
          labelText: "Password",
          // hintText: "Password",
        ),
        obscureText: true,
      ),
      SizedBox(
        height: 8,
      ),
      FormSubmitButton(
        text: "Enter",
        onPressed: () {
          print("daba");
        },
      ),
      // RaisedButton(
      //   onPressed: () {},
      //   child: Text("Sign In"),
      // ),
      SizedBox(
        height: 8,
      ),
      FlatButton(
        onPressed: () {},
        child: Text("Create an account"),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(),
      ),
    );
  }
}
