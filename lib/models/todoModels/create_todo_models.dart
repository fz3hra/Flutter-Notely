// To parse this JSON data, do
//
//     final createTodoModel = createTodoModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreateTodoModel createTodoModelFromMap(String str) =>
    CreateTodoModel.fromMap(json.decode(str));

String createTodoModelToMap(CreateTodoModel data) => json.encode(data.toMap());

class CreateTodoModel {
  CreateTodoModel({
    required this.userId,
    required this.title,
    required this.description,
  });

  final String userId;
  final String title;
  final String description;

  factory CreateTodoModel.fromMap(Map<String, dynamic> json) => CreateTodoModel(
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "title": title,
        "description": description,
      };
}
