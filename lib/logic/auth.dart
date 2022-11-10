import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:week6_tast_two/utils/failure.dart';

class Auth{

FirebaseAuth auth = FirebaseAuth.instance;
Future<UserCredential> register ({ required String email, required String password}) async{
  try{
    final user = auth.createUserWithEmailAndPassword(email: email, password: password);
    return user;
  } on FirebaseAuthException{
    throw Failure(message: "Firebase Authentication failed.");
  } on SocketException{
    throw Failure(message: "You're not connected to the internet. ");
  }
  catch(e){
    throw Failure(message: e.toString());
  }
}

Future<UserCredential> login ({required String email, required String password}) async{
  try{
    final user = auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  } on FirebaseAuthException{
    throw Failure(message: "Firebase Authentication failed.");
  } on SocketException{
    throw Failure(message: "You're not connected to the internet. ");
  }
  catch(e){
    throw Failure(message: e.toString());
  }
}

Future<void> resetPassword ({required String email}) async{
  try{
    auth.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException{
    throw Failure(message: "Firebase Authentication failed.");
  } on SocketException{
    throw Failure(message: "You're not connected to the internet. ");
  }
  catch(e){
    throw Failure(message: e.toString());
  }
}

Future<void> confirmResetPassword ({required String code, required String newPassword}) async{
  try{
    auth.confirmPasswordReset(code: code, newPassword: newPassword);
  } on FirebaseAuthException{
    throw Failure(message: "Firebase Authentication failed.");
  } on SocketException{
    throw Failure(message: "You're not connected to the internet. ");
  }
  catch(e){
    throw Failure(message: e.toString());
  }
}
}


