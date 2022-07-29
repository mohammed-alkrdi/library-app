
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_library/Models/create_comment.dart';


Future<http.Response?> comment(CreateComment data, String token, int bookId) async {
  http.Response? response;
  try {
    response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/comments/book/${bookId}/comment/create"),
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