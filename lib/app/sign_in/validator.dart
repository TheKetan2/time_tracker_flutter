abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    // TODO: implement isValid
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidator {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
}
