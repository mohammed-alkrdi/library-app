
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;


Future<http.Response?> getProfilee(String token) async {
  http.Response? response;
  try {
    response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/customer/profile"),
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