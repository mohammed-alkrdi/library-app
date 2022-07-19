import 'package:flutter/material.dart';

import '../Api/http_service_getallbooks.dart';
import '../Models/book_model.dart';

class Book {
  int id;
  String bookName;
  String author;
  double price;
  String imageUrl;
  String downloadUrl;

  Book({
      required this.id,
      required this.bookName,
      required this.author,
      required this.price,
      required this.imageUrl,
      required this.downloadUrl
      });
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["id"],
      bookName: json["name"],
      author: json["writer_book"],
      price: json["price"],
      imageUrl: json["image"],
      downloadUrl: json[" file"],
    );
  }
}


