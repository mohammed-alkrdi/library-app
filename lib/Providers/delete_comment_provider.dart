import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_library/Api/http_service_delete_comment.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DataDeleteComment extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> deleteData(int commentId) async {
    loading = true;
    notifyListeners();
    var token = await getToken();
    //print(token);
    http.Response? response = (await deleteComment(token!, commentId));
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