import 'package:flutter/cupertino.dart';

class ListOfBooks with ChangeNotifier {
 late List<Books> books;


  ListOfBooks({required this.books});

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
  bool? isMyLike;
  List<Likes>? likes;

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
    this.likes,
    this.isMyLike,
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
    isMyLike = json['is_liked_by_me'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
  }
}
class Likes with ChangeNotifier {
  int? id;
  int? customerId;
  int? like;
  int? bookId;
  String? createdAt;
  String? updatedAt;
  String? token;

  Likes({this.id,
    this.customerId,
    this.like,
    this.bookId,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    like = json['like'];
    bookId = json['book_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}