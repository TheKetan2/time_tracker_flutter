import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker_flutter/common_widgets/platform_alert_dialog.dart';

class PlatformExceptionAlertDialogue extends PlatformAlertDialog {
  PlatformExceptionAlertDialogue({
    @required String title,
    @required PlatformException exception,
  }) : super(
          title: title,
          content: exception.message,
          defaultActionText: "OK",
        );
}
