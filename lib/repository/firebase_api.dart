import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  Future<String?> registerUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthexception ${e.code}');
      return e.code;
    } on FirebaseException catch (e) {
      print('FirebaseAuthexception ${e.code}');
      return e.code;
    }
  }

  Future<String?> logInUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid.toString();
    } on FirebaseAuthException catch (e) {
      print('FirebaseException ${e.code}');
      return e.code;
    } on FirebaseException catch (e) {
      print('FirebaseException ${e.code}');
      return e.code;
    }
  }
}
