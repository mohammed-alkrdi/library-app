import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/http_service_book.dart';
import '../Models/book_model.dart';


class DataBook extends ChangeNotifier {
  Book? post;
  bool loading = false;

  getPostBook() async {
    var token = await getToken();
    //var id = await getId();
    print(token);
    loading = true;
    post = (await getBook(token!));
    loading = false;
    notifyListeners();

  }
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    return token;
  }
}