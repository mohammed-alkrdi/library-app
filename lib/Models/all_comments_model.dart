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

  GetComments(
      { this.commentId,
         this.message,
         this.customerId,
         this.bookId,
        });

  factory GetComments.fromJson(Map<String, dynamic> json) {
    return GetComments(
        commentId: json["id"],
        message: json["message"],
        customerId: json["customer_id"],
        bookId: json["book_id"],
    );
  }
}