// ignore_for_file: unused_element

import 'dart:convert';

import 'package:fec_app2/services.dart/urls_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NoticesProvider with ChangeNotifier {
  bool isNotValidate = false;

  void dataNotices(BuildContext context) async {
    var response = await http.get(
      Uri.parse(notice),
      headers: {
        'Authorization': 'Bearer zZT5D4MvFApZYy8fJZFbBEutfecgqB24CfDq5pbu',
        "Content-Type": "application/json"
      },
    );
    var jsonRespose = jsonDecode(response.body);
    print(1111111111111);
    print(jsonRespose);
    print(1111111111111);

    Future<String> getToken() async {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      return preferences.getString('token') ?? '';
    }

    if (jsonRespose['status']) {
      var myToken = jsonRespose['token'];

      Future<bool> setUserName(String username) async {
        final SharedPreferences preferences =
            await SharedPreferences.getInstance();
        return preferences.setString('token', myToken);
      }

      Fluttertoast.showToast(
          msg: '${jsonRespose['status']} Login Successfully');
    } else {
      Fluttertoast.showToast(msg: ' Error is something wrong');
      isNotValidate = true;
    }
    notifyListeners();
  }
}
