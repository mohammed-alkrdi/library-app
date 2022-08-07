import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../Models/update_comment_model.dart';


Future<http.Response?> updateComment(UpdateComment data, String token, int commentId) async {
  http.Response? response;
  try {
    response = await http.put(
      Uri.parse("http://10.0.2.2:8000/api/comments/updete_comment/"+commentId.toString()),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " + token,
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(data.toJson()),
    );
  } catch (e) {
    log(e.toString());
  }
  return response;
}