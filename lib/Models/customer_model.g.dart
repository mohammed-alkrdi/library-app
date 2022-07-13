// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer()
  ..name = json['name'] as String
  ..email = json['email'] as String
  ..password = json['password'] as String
  ..age = json['age'] as int
  ..phoneNumber = json['phone_number'] as int;

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'age': instance.age,
      'phone_number': instance.phoneNumber,
    };
