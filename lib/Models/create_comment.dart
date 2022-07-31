import 'package:flutter/cupertino.dart';

class CreateComment with ChangeNotifier {
  Comment? comment;

  CreateComment({this.comment});

  factory CreateComment.fromJson(Map<String, dynamic> json) {
    return CreateComment(
    comment:
    json['comment'] != null ? Comment.fromJson(json['comment']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (comment != null) {
      data['comment'] = comment!.toJson();
    }
    return data;
  }
}

class CommentRequest with ChangeNotifier {
  String? message;
  String token;

  CommentRequest({required this.message, required this.token});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    return data;
  }
}

class Comment with ChangeNotifier {
  String? message;
  int? bookId;
  int? customerId;
  String? updatedAt;
  String? createdAt;
  int? id;
  Customer? customer;

  Comment(
      {this.message,
        this.bookId,
        this.customerId,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.customer});

 factory Comment.fromJson(Map<String, dynamic> json) {
   return Comment(
    message: json['message'],
    bookId: json['book_id'],
    customerId: json['customer_id'],
    id: json['id'],
    customer: json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null,
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['book_id'] = bookId;
    data['customer_id'] = customerId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class Customer with ChangeNotifier {
  int? id;
  String? name;
  String? email;
  String? password;
  int? age;
  int? phoneNumber;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.age,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt
      });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    password: json['password'],
    age: json['age'],
    phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["age"] = age;
    data["phone_number"] = phoneNumber;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}