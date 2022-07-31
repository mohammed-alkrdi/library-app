import 'package:flutter/material.dart';
import 'package:my_library/Models/create_comment.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/http_service_comment.dart';

class DataComment extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(CommentRequest body, int bookId) async {
    loading = true;
    notifyListeners();
    var token = await getToken();
    //print(token);
    body.token = token!;
    http.Response? response = (await comment(body, bookId));
    if(response?.statusCode == 200) {
      print(response!.body);
      print("ok");
      isBack = true;

    } else {
      print("out");
      loading = false;
      notifyListeners();
    }
  }
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    return token;
  }
}