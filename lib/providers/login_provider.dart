import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  void inLoginForm(BuildContext context, final email, final password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) {
        Fluttertoast.showToast(msg: 'Login Successfully');
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
