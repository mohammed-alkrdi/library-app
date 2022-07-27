import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Api/http_service_logout.dart';
import '../Models/logout_request.dart';

class DataLogOut extends ChangeNotifier {

  bool loading = false;
  bool isBack = false;
  Future<void> postData() async {
    loading = true;
    notifyListeners();
    var token = await getToken();
    print(token);
    http.Response? response = await logOut(new LogOutRequest(token: token!));

    if(response?.statusCode == 200) {
      print("in");
      isBack = true;
    } else {
    loading = false;
    print("out");
    notifyListeners();
    }
  }
    Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    return token;
  }
}