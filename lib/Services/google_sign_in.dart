import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_todo/DataList.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  bool newUser = false;

  GoogleSignInAccount get user => _user!;
  final db = FirebaseFirestore.instance;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null) {
      throw '----- NULL ERROR -----';
    }
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
   final UserCredential authResult =  await FirebaseAuth.instance.signInWithCredential(credentials);

    ///Her to check isNewUser OR Not final db =
    final current_user = FirebaseAuth.instance.currentUser;

    if (authResult.additionalUserInfo!.isNewUser) {
      if (current_user != null) {
        await db.collection("users").add({
          "email_id" : current_user.email,
          "user_id ": current_user.uid,
        });
      }

    }
    notifyListeners();
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

  }

  Future<void> addToDataBase (DataList dataList)async {

  }


}