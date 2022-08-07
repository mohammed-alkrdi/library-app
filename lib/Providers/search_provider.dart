import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_library/Api/http_service_search.dart';
import 'package:my_library/Models/books_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class DataSearch extends ChangeNotifier {

  ListOfBooks? listOkBooks = null;
  bool loading = false;
  bool isBack = false;
  Future<void> getData(String name) async {
    if(name == null || name == "") {
      listOkBooks = null;
      notifyListeners();
      return;
    }
    loading = true;
    //notifyListeners();
    var token = await getToken();
    //print(token);
    http.Response? response = await search(token!, name);

    if(response?.statusCode == 200) {
      List<Books> books = (json.decode(response!.body) as List).map((j) => Books.fromJson(j)).toList();
      listOkBooks = new ListOfBooks(books: books);
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