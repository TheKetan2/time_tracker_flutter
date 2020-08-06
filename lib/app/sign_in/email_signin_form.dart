import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/custom_raised_buttons/form_custom_raised_button.dart';
import 'package:time_tracker_flutter/app/services/auth.dart';
import 'package:time_tracker_flutter/app/sign_in/validator.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidator {
  final AuthBase auth;

  EmailSignInForm({this.auth});
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

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

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
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

    bool submitEnable = _email.isNotEmpty && _password.isNotEmpty;

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
        onPressed: widget.emailValidator.isValid(_email) &&
                widget.emailValidator.isValid(_password)
            ? _submit
            : null,
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
    bool passwordValid = widget.passwordValidator.isValid(_password);
    return TextField(
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      onEditingComplete: _submit,
      onChanged: (password) => _updateState(),
      decoration: InputDecoration(
        labelText: "Password",
        errorText: passwordValid ? null : "Password can't be empty",
        // hintText: "Password",
      ),
      obscureText: true,
    );
  }

  TextField _buildEmailTextField() {
    bool emailValid = widget.emailValidator.isValid(_email);
    return TextField(
      focusNode: _emailFocusNode,
      controller: _emailController,
      onEditingComplete: _emailEditingComplete,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: (email) => _updateState(),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        errorText: emailValid ? null : "Email can't be empty",
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

  void _updateState() {
    setState(() {});
  }
}
