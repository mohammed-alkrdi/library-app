import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/http_service_get_profile.dart';
import '../Api/http_service_book.dart';
import '../Models/book_model.dart';
import '../Models/profile_model.dart';




class DataProfile extends ChangeNotifier {

  Profile? postProfile;
  bool loading = false;
  bool isBack = false;
  Future<void> getData() async {
    loading = true;
    var token = await getToken();
    //print(token);
    http.Response? response = (await getProfile(token!));

    if(response?.statusCode == 200) {
      Map<String, dynamic> profile = json.decode(response!.body) as Map<String, dynamic>;
      postProfile =  Profile.fromJson(profile);
     // print("in");
      isBack = true;
      loading = false;
      notifyListeners();
    } else {
      loading = false;
      //print("out");
      notifyListeners();
    }
  }
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    return token;
  }
}