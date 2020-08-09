import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker_flutter/common_widgets/platform_alert_dialog.dart';

class PlatformExceptionAlertDialogue extends PlatformAlertDialog {
  PlatformExceptionAlertDialogue({
    @required String title,
    @required PlatformException exception,
  }) : super(
          title: title,
          content: _message(exception),
          defaultActionText: "OK",
        );

  static String _message(PlatformException exception) {
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    /**
     * "ERROR_WEAK_PASSWORD"
     * "ERROR_INVALID_CREDENTIAL"
     * "ERROR_EMAIL_ALREADY_IN_USE"
     * "ERROR_INVALID_EMAIL"
     * "ERROR_WRONG_PASSWORD"
     * "ERROR_USER_NOT_FOUND"
     * "ERROR_USER_DISABLED"
     * "ERROR_TOO_MANY_REQUESTS"
     * "ERROR_OPERATION_NOT_ALLOWED"
     */
  };
}
