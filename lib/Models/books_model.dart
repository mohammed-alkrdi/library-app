import 'package:flutter/cupertino.dart';

class ListOfBooks with ChangeNotifier {
 late List<Books> books;


  ListOfBooks({required this.books});

}

class Books {
  int? id;
  String? name;
  String? writerBook;
  String? bookInfo;
  int? price;
  String? image;
  String? file;
  String? contactInfo;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  bool? isLikedByMe;
  bool? isRequestedByMe;
  List<Likes>? likes;
  List<Requests>? requests;

  Books(
      {this.id,
        this.name,
        this.writerBook,
        this.bookInfo,
        this.price,
        this.image,
        this.file,
        this.contactInfo,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.isLikedByMe,
        this.isRequestedByMe,
        this.likes,
        this.requests});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    writerBook = json['writer_book'];
    bookInfo = json['book_info'];
    price = json['price'];
    image = json['image'];
    file = json['file'];
    contactInfo = json['contact_info'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isLikedByMe = json['is_liked_by_me'];
    isRequestedByMe = json['is_requested_by_me'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(Requests.fromJson(v));
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

  Likes(
      {this.id,
        this.customerId,
        this.like,
        this.bookId,
        this.createdAt,
        this.updatedAt});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    like = json['like'];
    bookId = json['book_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Requests with ChangeNotifier {
  int? id;
  int? customerId;
  int? bookId;
  int? status;
  String? createdAt;
  String? updatedAt;

  Requests(
      {this.id,
        this.customerId,
        this.bookId,
        this.status,
        this.createdAt,
        this.updatedAt});

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    bookId = json['book_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}