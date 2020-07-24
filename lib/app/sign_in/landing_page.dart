import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/homepage.dart';
import 'package:time_tracker_flutter/app/services/auth.dart';
import 'package:time_tracker_flutter/app/sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;

  const LandingPage({
    Key key,
    this.auth,
  }) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    // Todo: this method must be synchronous
    _checkCurrentUser();
    super.initState();
  }

  Future<void> _checkCurrentUser() async {
    User user = await widget.auth.currentUser();
    print(user);
    _updateUser(user);
  }

  void _updateUser(User user) {
    print(user);
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _user == null
        ? SignInPage(
            auth: widget.auth,
            onSignIn: _updateUser,
          )
        : HomePage(
            auth: widget.auth,
            onSignOut: () => _updateUser(null),
          );
  }
}
