import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/Http_service_like.dart';
import '../Models/like_model.dart';




class DataLike extends ChangeNotifier {

  Like? postLike;
  bool loading = false;
  bool isBack = false;
  Future<void> getData(int bookId) async {
    loading = true;
    var token = await getToken();
    //print(token);
    http.Response? response = (await getLike(token!, bookId));

    if(response?.statusCode == 200) {
      Map<String, dynamic> like = json.decode(response!.body) as Map<String, dynamic>;
      postLike =  Like.fromJson(like);
      //print("in");
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