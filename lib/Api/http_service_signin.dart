import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_library/Models/signin_model.dart';



Future<http.Response?> logIn(SignInBody data) async {
  http.Response? response;
  try {
    response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/customer/login"),
      headers:  {
      HttpHeaders.contentTypeHeader: "application/json",
    },
      body: jsonEncode(data.toJson()),
    );
  } catch (e) {
    log(e.toString());
  }
  return response;
}