import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/http_service_getallbooks.dart';
import '../Models/books_model.dart';

class DataBooks extends ChangeNotifier {
  late ListOfBooks books;
  bool loading = false;

  getPostBooks() async {
    var token = await getToken();
    print(token);
    loading = true;
    books = (await getAllBooks(token!)) as ListOfBooks;
    loading = false;
    notifyListeners();
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    return token;
  }

  /*Future<String?> storeToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token", token);
  }*/
}