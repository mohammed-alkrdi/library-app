import 'dart:convert';
import 'dart:io';

import 'package:my_library/Models/profile_model.dart';
import 'package:http/http.dart' as http;
Future<Profile?> getProfile(String token) async {
  Profile? result;
  try {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/customer/profile"),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " + token,
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      //print(item);
       result = Profile.fromJson(item);
      print(result);
    } else {
      print("no re");
    }
  } catch (e) {
    print(e.toString());
    print("no result");
  }
  return result;
}