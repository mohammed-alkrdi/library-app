import 'package:flutter/cupertino.dart';

class Like with ChangeNotifier {
  String bookId;
  int customerId;
  int like;
  int likeId;

  Like(
      {required this.bookId,
      required this.customerId,
      required this.like,
      required this.likeId});

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      bookId: json["book_id"],
      customerId: json["customer_id"],
      like: json["like"],
      likeId: json["id"],
    );
  }
}
