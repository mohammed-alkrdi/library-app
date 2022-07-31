
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;


Future<http.Response?> category(String token) async {
  http.Response? response;
  try {
    response = await http.get(
      Uri.parse("http://127.0.0.1:8000/api/category/get_category"),
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
