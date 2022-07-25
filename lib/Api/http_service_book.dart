import 'dart:convert';
import 'dart:io';

import '../Models/book_model.dart';
import 'package:http/http.dart' as http;
Future<Book?> getBook(String token) async {
  Book? result;
  try {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/book/show/4"),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " +token,
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      print("ok");
      final item = json.decode(response.body);
      result = Book.fromJson(item);
    } else {
      print("no re");
    }
  } catch (e) {
    print(e.toString());
    print("no result");
  }
  return result;
}