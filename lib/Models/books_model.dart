import 'package:flutter/cupertino.dart';

class ListOfBooks with ChangeNotifier {
 late List<Books> _books;
 List<Books> get books => _books;

  ListOfBooks({required books}) {
    this._books = books;
  }
  ListOfBooks.fromJson(Map<String, dynamic> json) {
    if(json['books'] != null) {
      _books = <Books>[];
      json['books'].forEach((v) {
      _books.add(Books.fromJson(v));
      });
    }
  }
}

class Books with ChangeNotifier {
  int? id;
  String? name;
  String? author;
  int? price;
  String? imageUrl;
  String? downloadUrl;
  String? contactInfo;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  String? token;
  bool? isFavorite;

  Books({this.id,
    this.name,
    this.author,
    this.price,
    this.imageUrl,
    this.downloadUrl,
    this.contactInfo,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.isFavorite = false,
  });

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['writer_book'];
    price = json['price'];
    imageUrl = json['image'];
    downloadUrl = json['file'];
    contactInfo = json['contact_info'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  void toggleFavoriteStatus() {
    isFavorite = !isFavorite!;
    notifyListeners();
  }
}
