import 'package:flutter/material.dart';
import 'package:my_library/Api/http_service.dart';
import 'package:my_library/Models/signup_model.dart';
import 'package:http/http.dart' as http;

class DataSignUp extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(SignUpBody body) async {
    loading = true;
    notifyListeners();
    http.Response? response = (await register(body));
    if(response?.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}