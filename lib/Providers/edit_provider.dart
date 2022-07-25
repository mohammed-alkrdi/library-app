import 'package:flutter/material.dart';
import 'package:my_library/Api/http_service_edit.dart';
import 'package:my_library/Models/edit_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileData extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(EditProfileBody body) async {
    loading = true;
    notifyListeners();
    var token = await getToken();
    print(token);
    body.token = token!;
    http.Response? response = (await edit(body));
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