import 'package:json_annotation/json_annotation.dart';



part 'customer_model.g.dart';

@JsonSerializable()
class Customer {
  @JsonKey(name : "name")
  late String name;

  @JsonKey(name : "email")
  late String email;

  @JsonKey(name : "password")
  late String password;

  @JsonKey(name : "age")
  late int age;

  @JsonKey(name : "phone_number")
  late int phoneNumber;

  Customer();

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}