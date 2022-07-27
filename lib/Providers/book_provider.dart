import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/http_service_book.dart';
import '../Models/book_model.dart';




class DataBook extends ChangeNotifier {

  Book? postBook;
  bool loading = false;
  bool isBack = false;
  Future<void> getData(int bookId) async {
    loading = true;
    var token = await getToken();
    //print(token);
    http.Response? response = (await getBook(token!, bookId));

    if(response?.statusCode == 200) {
      Map<String, dynamic> book = json.decode(response!.body) as Map<String, dynamic>;
      postBook =  Book.fromJson(book);
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