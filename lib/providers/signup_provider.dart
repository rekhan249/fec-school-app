import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpProvider with ChangeNotifier {
  final firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  void onSubmittedSignUpForm(
      BuildContext context, final userName, final email, final password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      sendDataToFireBase(userName, email, password);
    }).catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  void sendDataToFireBase(userName, email, password) async {
    await firebaseFirestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .set(<String, dynamic>{});
    Fluttertoast.showToast(msg: "Account Create Successfully");
  }
}
