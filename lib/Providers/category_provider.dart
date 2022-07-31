import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_library/Api/http_service_categroy.dart';
import 'package:my_library/Models/get_category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class DataCategory extends ChangeNotifier {
  ListOfCategory? listOkCategory = null;
  bool loading = false;
  bool isBack = false;

  Future<void> getData() async {
    loading = true;

    var token = await getToken();

    http.Response? response  = await category(token!);

    if(response?.statusCode == 200) {
      List<GetCategory> category =(json.decode(response!.body) as List).map((j) => GetCategory.fromJson(j)).toList();
      listOkCategory = new ListOfCategory(category: category);

      isBack = true;
      loading = false;
      notifyListeners();
    } else {
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