import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_library/Models/all_comments_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Api/http_service_comment.dart';
import '../Api/http_service_delete_comment.dart';
import '../Api/http_service_get_all_comments.dart';
import '../Api/http_service_update_comment.dart';
import '../Models/create_comment.dart';
import '../Models/update_comment_model.dart';


class DataComments extends ChangeNotifier {

  ListOfComments? listOkComments = null;
  bool loading = false;
  bool isBack = false;
  Future<void> getData(int bookId) async {
    loading = true;
    //notifyListeners();
    var token = await getToken();
    //print(token);
    http.Response? response = await comments(token!, bookId);

    if(response?.statusCode == 200) {
      List<GetComments> comments = (json.decode(response!.body) as List).map((j) => GetComments.fromJson(j)).toList();
      listOkComments = new ListOfComments(comments: comments);
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
  Future<void> postData(CommentRequest body, int bookId) async {
    loading = true;
    notifyListeners();
    var token = await getToken();
    //print(token);
    body.token = token!;
    http.Response? response = (await comment(body, bookId));
    if(response?.statusCode == 200) {
      print(response!.body);
      print("ok");
      isBack = true;
      notifyListeners();

    } else {
      print("out");
      loading = false;
      notifyListeners();
    }
  }
  Future<void> putData(UpdateComment body, int commentId) async {
    loading = true;
    notifyListeners();
    var token = await getToken();
    //print(token);
    body.token = token!;
    http.Response? response = (await updateComment(body, token, commentId));
    if(response?.statusCode == 200) {
      print(response!.body);
      print("ok");
      isBack = true;
      notifyListeners();

    } else {
      print("out");
      loading = false;
      notifyListeners();
    }
  }
  Future<void> deleteData(int commentId) async {
    loading = true;
    notifyListeners();
    var token = await getToken();
    //print(token);
    http.Response? response = (await deleteComment(token!, commentId));
    if(response?.statusCode == 200) {
      print(response!.body);
      print("ok");
      isBack = true;
      notifyListeners();

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