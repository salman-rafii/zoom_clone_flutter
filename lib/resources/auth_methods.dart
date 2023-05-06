// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone_flutter/resources/firebase_collections.dart';
import 'package:zoom_clone_flutter/resources/firebase_methods.dart';
import 'package:zoom_clone_flutter/utils/utils.dart';

class AuthMethods {
  Stream<User?> get authChanges => firebaseAuth.authStateChanges();
  User get user => firebaseAuth.currentUser!;
  void logout() async {
    try {
      firebaseAuth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await firestore
              .collection(FirebaseConstants.usersCollection)
              .doc(user.uid)
              .set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      res = false;
      showSnackBar(context, e.message!);
    }
    return res;
  }
}
