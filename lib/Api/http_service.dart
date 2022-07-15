import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_library/Models/signup_model.dart';


Future<http.Response?> register(SignUpBody data) async {
  http.Response? response;
  try {
    response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/user/register"),
      headers:  {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(data.toJson()));
  } catch (e) {
    log(e.toString());
  }
  return response;
}