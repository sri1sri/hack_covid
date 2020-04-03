abstract class StringValidator{
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator{
  @override
  bool isValid(String value) {
    if (value == null){
      return false;
    }
    // TODO: implement isValid
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidator {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();

  final String invalidEmailErrorText = 'Email cant be empty';
  final String invalidPasswordErrorText = 'Password cant be empty';

}

class RegisterAccountValidator {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Email cant be empty';

  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String invalidPasswordErrorText = 'Password cant be empty';

  final StringValidator rePasswordValidator = NonEmptyStringValidator();
  final String invalidRePasswordErrorText = 'Re-password cant be empty';
}