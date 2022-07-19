import 'dart:convert';
import 'dart:io';

import '../Models/book_model.dart';
import 'package:http/http.dart' as http;
Future<Book?> getAllBooks() async {
  Book? result;
  try {
    final response = await http.get(
      Uri.parse(""),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = Book.fromJson(item);
    } else {
      print("no re");
    }
  } catch (e) {
    print("no result");
  }
  return result;
}