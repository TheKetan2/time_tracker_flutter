import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  // final String title;
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final double borderRadius;

  const CustomRaisedButton({
    this.onPressed,
    this.child,
    this.color = Colors.white,
    this.borderRadius = 4.0,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      onPressed: onPressed,
      child: child,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            borderRadius,
          ),
        ),
      ),
    );
  }
}
