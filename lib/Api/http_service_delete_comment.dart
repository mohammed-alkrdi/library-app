import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;



Future<http.Response?> deleteComment(String token, int commentId) async {
  http.Response? response;
  try {
    response = await http.delete(
      Uri.parse("http://10.0.2.2:8000/api/comments/delete_comment/"+commentId.toString()),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " + token,
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  } catch (e) {
    log(e.toString());
  }
  return response;
}