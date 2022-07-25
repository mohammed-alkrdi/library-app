import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_library/Models/signin_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Api/http_service_signin.dart';


class DataSignIn extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;


  Future<void> postData(SignInBody body) async {
    loading = true;
    notifyListeners();
    http.Response? response = (await logIn(body));
    if(response?.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", true);
      final body = jsonDecode(response!.body);
      await storeToken(body["token"]);
      print(body["token"]);
      isBack = true;
    } else {
      print("out");
      loading = false;
      notifyListeners();
    }
  }
    Future<String?> storeToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token", token);
  }
}