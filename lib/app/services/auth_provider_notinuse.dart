import 'package:flutter/cupertino.dart';

import "package:flutter/material.dart";
import 'package:time_tracker_flutter/app/services/auth.dart';

class AuthProvider extends InheritedWidget {
  final AuthBase auth;
  final Widget child;

  AuthProvider({
    @required this.auth,
    @required this.child,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static AuthBase of(BuildContext context) {
    AuthProvider provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>();

    return provider.auth;
  }
}
