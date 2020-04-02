import 'package:flutter/cupertino.dart';
import 'package:hackcovid/firebase/auth.dart';
import 'package:hackcovid/model/validators.dart';

class EmailSignInChangeModel with EmailAndPasswordValidator, ChangeNotifier {
  EmailSignInChangeModel({
    @required this.auth,
      this.email = '',
      this.password = '',
      this.isLoading = false,
      this.submitted = false
      });

  final AuthBase auth;

   String email;
   String password;
   bool isLoading;
   bool submitted;

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      await auth.signInWithEmail(email, password);
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        passwordValidator.isValid(password) &&
        !isLoading;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  void toogleFormType() {
    updateWith(
      email: '',
      password: '',
      submitted: false,
      isLoading: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
    bool isLoading,
    bool submitted,
  }) {
      this.email = email ?? this.email;
      this.password = password ?? this.password;
      this.isLoading = isLoading ?? this.isLoading;
      this.submitted = submitted ?? this.submitted;

      notifyListeners();
  }
}
