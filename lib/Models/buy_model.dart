import 'package:flutter/material.dart';

class Buy with ChangeNotifier {
  int? customerId;
  int? bookId;
  int? buyId;
  String? token;

  Buy({this.customerId, this.bookId, this.buyId, this.token});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["customer_id"] = customerId;
    data["book_id"] = bookId;
    data["id"] = buyId;

    return data;
  }
}
