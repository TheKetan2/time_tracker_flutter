import 'package:flutter/material.dart';
import 'dart:io';

abstract class PlatformWidget extends StatelessWidget {
  Widget buildCupertinoWidget(BuildContext context);

  Widget buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return buildCupertinoWidget(context);
    } else if (Platform.isAndroid) {
      return buildMaterialWidget(context);
    }
  }
}
