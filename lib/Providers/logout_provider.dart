import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Api/http_service_logout.dart';
import '../Models/logout_request.dart';

class DataLogOut extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(LogOutRequest body) async {
    loading = true;
    notifyListeners();
    http.Response? response = (await logOut(body));
   await getToken();
    if(response?.statusCode == 200) {
      //await getToken();
      print("in");
      isBack = true;
    }
    print("out");
    loading = false;
    notifyListeners();
  }
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    return token;
  }
}