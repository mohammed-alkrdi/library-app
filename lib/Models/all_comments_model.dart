import 'package:flutter/cupertino.dart';

class ListOfComments with ChangeNotifier {
  late List<GetComments> comments;

  ListOfComments({required this.comments}) {
    //this.comments = comments;
  }
}

class GetComments with ChangeNotifier {
  int? commentId;
  String? message;
  int? customerId;
  int? bookId;
  bool? myComment;
  String? createdAt;
  String? updatedAt;
  Customer? customer;

  GetComments({
    this.commentId,
    this.message,
    this.customerId,
    this.bookId,
    this.createdAt,
    this.updatedAt,
    this.customer,
    this.myComment,
  });

  factory GetComments.fromJson(Map<String, dynamic> json) {
    return GetComments(
        commentId: json["id"],
        message: json["message"],
        customerId: json["customer_id"],
        bookId: json["book_id"],
        myComment: json["is_my_comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        customer : json['customer'] != null
        ?  Customer.fromJson(json['customer'])
        : null,);
  }
}

class Customer with ChangeNotifier {
  int? id;
  String? name;
  String? email;
  String? password;
  int? age;
  int? phoneNumber;


  Customer({
    this.id,
    this.name,
    this.email,
    this.password,
    this.age,
    this.phoneNumber,
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
}
