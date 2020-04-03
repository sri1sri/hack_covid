
import 'package:flutter/cupertino.dart';
import 'package:hackcovid/firebase/auth.dart';
import 'package:hackcovid/model/validators.dart';

class RegisterAccountPageModel with RegisterAccountValidator, ChangeNotifier {
  RegisterAccountPageModel({
    @required this.auth,

    this.email = '',
    this.password = '',
    this.rePassword = '',
    this.isLoading = false ,
    this.submitted = false
  });

  final AuthBase auth;

  String email;
  String password;
  String rePassword;
  bool isLoading;
  bool submitted;

  Future <void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      await auth.registerWithEmail(this.email, this.password);
      print('email --> ${this.email + this.password}');

    } catch (e) {
      rethrow;
    } finally {
      updateWith(isLoading: false);
    }
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateRePassword(String rePassword) => updateWith(rePassword: rePassword);

  bool get canSubmit{
    return emailValidator.isValid(email)
        && passwordValidator.isValid(password)
        && rePasswordValidator.isValid(rePassword)
        && rePassword == password
        && !isLoading;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  String get rePasswordErrorText {
    bool showErrorText = submitted && !rePasswordValidator.isValid(rePassword);
    return showErrorText ? invalidRePasswordErrorText : null;
  }

  void updateWith({
    String email,
    String password,
    String rePassword,
    bool isLoading,
    bool submitted,

  }) {

    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.rePassword = rePassword ?? this.rePassword;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;

    notifyListeners();
  }
}