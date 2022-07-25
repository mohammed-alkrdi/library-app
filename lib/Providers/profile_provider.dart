import 'package:flutter/material.dart';
import 'package:my_library/Api/http_service_profile.dart';
import 'package:my_library/Models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DataProfile extends ChangeNotifier {
  Profile? post;
  bool loading = false;

  getPostProfile() async {
    var token = await getToken();
    print(token);
    loading = true;
    post = (await getProfile(token!));
    loading = false;
    notifyListeners();

  }
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    return token;
  }
}