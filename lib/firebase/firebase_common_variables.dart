import 'package:firebase_auth/firebase_auth.dart';
Future<String> USERID()async{
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  return user.uid;
}