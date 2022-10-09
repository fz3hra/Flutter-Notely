// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  final String name;
  final String email;
  final String password;
  final String type;
  final String id;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.type,
    required this.id,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        type: json["type"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
        "type": type,
        "_id": id,
      };
}
