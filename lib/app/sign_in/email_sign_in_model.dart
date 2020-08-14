// import 'package:time_tracker_flutter/app/sign_in/email_sign_in_form.dart';
enum EmailSignInFormType { signIn, register }

class EmailSignInModel {
  final String email;
  final String password;
  final EmailSignInFormType formType;
  final bool isLoading;
  final bool submitted;

  EmailSignInModel({
    this.email = "",
    this.password = "",
    this.formType = EmailSignInFormType.signIn,
    this.isLoading,
    this.submitted,
  });
}
