import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/custom_raised_buttons/form_custom_raised_button.dart';
import 'package:time_tracker_flutter/app/services/auth.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  final AuthBase auth;

  const EmailSignInForm({Key key, this.auth}) : super(key: key);
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  void _submit() async {
    // print(
    //     "email: ${_emailController.text},\nPassword: ${_passwordController.text}");
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(
          _email,
          _password,
        );
      } else {
        await widget.auth.createUserWithEmailAndPassword(
          _email,
          _password,
        );
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.register
          ? EmailSignInFormType.signIn
          : EmailSignInFormType.register;
    });

    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? "Sign in"
        : "Create an account";

    final secondayText = _formType == EmailSignInFormType.signIn
        ? "Need an account? Register"
        : "Have and account? Sign in";
    return [
      _buildEmailTextField(),
      SizedBox(
        height: 8,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 8,
      ),
      FormSubmitButton(
        text: primaryText,
        onPressed: _submit,
      ),
      // RaisedButton(
      //   onPressed: () {},
      //   child: Text("Sign In"),
      // ),
      SizedBox(
        height: 8,
      ),
      FlatButton(
        onPressed: _toggleFormType,
        child: Text(secondayText),
      )
    ];
  }

  TextField _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: "Password",
        // hintText: "Password",
      ),
      obscureText: true,
    );
  }

  TextField _buildEmailTextField() {
    return TextField(
      controller: _emailController,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "username@email.com",
      ),
    );
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
