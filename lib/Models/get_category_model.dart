import 'package:flutter/material.dart';


class ListOfCategory with ChangeNotifier{
  late List<GetCategory> category;

  ListOfCategory({required this.category});
}


class GetCategory with ChangeNotifier {
  int? id;
  String? name;

  GetCategory({this.id, this.name});

  GetCategory.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}