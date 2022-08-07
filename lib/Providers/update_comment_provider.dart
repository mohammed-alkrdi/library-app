import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_library/Models/update_comment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/http_service_update_comment.dart';

class DataUpdateComment extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> putData(UpdateComment body, int commentId) async {
    loading = true;
    notifyListeners();
    var token = await getToken();
    //print(token);
    body.token = token!;
    http.Response? response = (await updateComment(body, token, commentId));
    if(response?.statusCode == 200) {
      print(response!.body);
      print("ok");
      isBack = true;
      //notifyListeners();

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