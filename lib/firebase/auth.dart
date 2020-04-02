import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User {
  User({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Stream<User> get onAuthStateChanges;

  Future<User> currentUser();

  Future<User> signInAnonymously();

  Future<User> verifyPhoneNumber(String phoneNumber);

  Future<User> signInWithEmail(String email, String password);

  Future<User> registerWithEmail(String email, String password);

  Future<User> verifyOtp(String smsCode);

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  String verificationId;
  String phoneNumberWithCode;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Stream<User> get onAuthStateChanges {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<User> signInWithEmail(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> registerWithEmail(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> verifyPhoneNumber(String phoneNumber) async {
    phoneNumberWithCode = '+91' + phoneNumber;

    final PhoneCodeAutoRetrievalTimeout autoRetrieval =
        (String verificationId) {
      this.verificationId = verificationId;
    };

    final PhoneCodeSent smsCodeSent =
        (String verificationId, [int forceCodeResend]) {
      this.verificationId = verificationId;
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {
      print('Verified');
    };

    final PhoneVerificationFailed verifiedFailed = (AuthException exception) {
      print('${exception.message}');
    };

    print('${this.phoneNumberWithCode} <- phone number');

    await _firebaseAuth
        .verifyPhoneNumber(
      phoneNumber: this.phoneNumberWithCode,
      timeout: Duration(seconds: 60),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifiedFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieval,
    )
        .then((user) {
      print('${this.verificationId} <- verification idd');
    });
  }

  @override
  Future<User> verifyOtp(String smsCode) async {
    final _authCredential = PhoneAuthProvider.getCredential(
        verificationId: this.verificationId, smsCode: smsCode);

    final authResult =
    await _firebaseAuth.signInWithCredential(_authCredential);
    print('${authResult.user.uid}<- uid from phone number');
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {

    await _firebaseAuth.signOut();
  }
}
