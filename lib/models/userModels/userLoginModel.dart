// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserLoginModel userLoginModelFromMap(String str) =>
    UserLoginModel.fromMap(json.decode(str));

String userLoginModelToMap(UserLoginModel data) => json.encode(data.toMap());

class UserLoginModel {
  UserLoginModel({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.type,
  });

  final String token;
  final String id;
  final String name;
  final String email;
  final String password;
  final String type;

  factory UserLoginModel.fromMap(Map<String, dynamic> json) => UserLoginModel(
        token: json["token"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "type": type,
      };
}
