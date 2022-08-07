import 'package:flutter/cupertino.dart';

class UpdateComment with ChangeNotifier {
  String? message;
  String? token;

  UpdateComment({required this.message, this.token});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    return data;
  }
}