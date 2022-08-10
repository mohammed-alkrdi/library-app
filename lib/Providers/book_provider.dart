import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_library/Api/http_service_buy.dart';
import 'package:my_library/Api/http_service_request.dart';
import 'package:my_library/Models/status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/http_service_book.dart';
import '../Models/book_model.dart';
import '../Models/buy_model.dart';




class DataBook extends ChangeNotifier {

  Status? postStatus;
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
  Future<void> postData(Buy body) async {
    loading = true;
    var token = await getToken();

    http.Response? response = (await buy(body, token!));

    if(response?.statusCode == 200) {
      print("wow");
      print(response!.body);
      isBack = true;
      notifyListeners();

    } else {
      print(response!.body);
      print("out");
      loading = false;
      notifyListeners();
    }
  }
  Future<void> getRequestData(int bookId) async {
    loading = true;
    var token = await getToken();

    http.Response? response = await request(token!, bookId);
    if(response?.statusCode == 200) {
      Map<String, dynamic> status = json.decode(response!.body) as Map<String, dynamic>;
      postStatus =  Status.fromJson(status);
      print("in");
      isBack = true;
      loading = false;
      notifyListeners();
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