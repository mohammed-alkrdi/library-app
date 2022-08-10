import 'package:flutter/cupertino.dart';

class Status with ChangeNotifier {

  int? id;
  int? customerId;
  int? bookId;
  int? status;
  String? token;

  Status({this.id, this.customerId, this.bookId, this.status, this.token});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json["id"],
      customerId: json["customer_id"],
      bookId: json["book_id"],
      status: json["status"],
    );
  }
}



