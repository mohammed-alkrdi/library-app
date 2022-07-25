import 'dart:convert';
import 'dart:io';

import '../Models/books_model.dart';
import 'package:http/http.dart' as http;
Future<ListOfBooks?> getAllBooks(String token) async {
  ListOfBooks? result;
  try {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/book/get_books"),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer " +token,
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(json.decode(response.body));
    if (response.statusCode == 200) {
     final books = (jsonDecode(response.body) as List).map((jsonBooks) =>Books.fromJson(jsonBooks));
      result = books as ListOfBooks;
    } else {
      print("no re");
    }
  } catch (e) {
    print(e.toString());
    print("no result");
  }
  return result;
}