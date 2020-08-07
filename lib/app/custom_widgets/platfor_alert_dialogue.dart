import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_tracker_flutter/app/custom_widgets/platform_widgets.dart';

class PlatformAlertDialogue extends PlatformWidget {
  final String title;
  final String content;
  final String defualtActionText;

  PlatformAlertDialogue({
    @required this.title,
    @required this.content,
    @required this.defualtActionText,
  })  : assert(title != null),
        assert(content != null),
        assert(defualtActionText != null);

  Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      PlatformAlertDialogueAction(
        child: Text(defualtActionText),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ];
  }
}

class PlatformAlertDialogueAction extends PlatformWidget {
  final Widget child;
  final VoidCallback onPressed;

  PlatformAlertDialogueAction({
    this.child,
    this.onPressed,
  });

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext contexntext) {
    return FlatButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
