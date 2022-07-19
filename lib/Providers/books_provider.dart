import 'package:flutter/material.dart';

import '../Api/http_service_getallbooks.dart';
import '../Models/book_model.dart';

class DataBooks extends ChangeNotifier {
  Book? post;
  bool loading = false;

  getPostBook() async {
    loading = true;
    post = (await getAllBooks())!;
    loading = false;
    notifyListeners();
  }
}