import 'package:flutter/material.dart';

import 'package:time_tracker_flutter/app/custom_raised_buttons/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
    double height = 50,
    String assetName,
  }) : super(
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
              Container()
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}