import 'package:flutter/material.dart';

class Book with ChangeNotifier {
  int? id;
  String? name;
  String? author;
  int? price;
  String? description;
  String? imageUrl;
  String? downloadUrl;
  String? token;
  int? categoryId;
  bool isFavorite;

  Book({
    this.id,
    this.name,
    this.author,
    this.price,
    this.description,
    this.imageUrl,
    this.downloadUrl,
    this.categoryId,
    this.token,
    this.isFavorite = false,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["id"],
      name: json["name"],
      author: json["writer_book"],
      price: json["price"],
      description: json["book_info"],
      imageUrl: json["image"],
      downloadUrl: json["file"],
    );
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
