
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../Models/logout_request.dart';

Future<http.Response?> logOut(LogOutRequest data) async {
  http.Response? response;
  try {
    response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/customer/logout"),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " + data.token,
      },
    );
  } catch (e) {
    log(e.toString());
  }
  return response;
}
