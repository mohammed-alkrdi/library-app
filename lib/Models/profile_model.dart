import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  int id;
  String name;
  String email;
  int phoneNumber;
  int age;
  String password;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.age,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      age: json["age"],
      phoneNumber: json["phone_number"],
    );
  }
}