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
    required this.title,
    required this.description,
    required this.id,
  });

  final String title;
  final String description;
  final String id;

  factory CreateTodoModel.fromMap(Map<String, dynamic> json) => CreateTodoModel(
        title: json["title"],
        description: json["description"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "_id": id,
      };
}
