import 'package:flutter/material.dart';

class Book with ChangeNotifier {
  int id;
  String name;
  String author;
  int price;
  String imageUrl;
  String downloadUrl;
  String? token;
  int? categoryId;
  bool isFavorite;
  String image;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.price,
    required this.imageUrl,
    required this.downloadUrl,
    this.categoryId,
    this.token,
    this.isFavorite = false,
    this.image = "http://127.0.0.1:8000/storage/",
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["id"],
      name: json["name"],
      author: json["writer_book"],
      price: json["price"],
      imageUrl: json["image"],
      downloadUrl: json["file"],
    );
  }
  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
