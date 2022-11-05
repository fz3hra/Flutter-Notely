// To parse this JSON data, do
//
//     final getToDoUniqueUserModel = getToDoUniqueUserModelFromMap(jsonString);

import 'dart:convert';

List<GetToDoUniqueUserModel> getToDoUniqueUserModelFromMap(String str) =>
    List<GetToDoUniqueUserModel>.from(
        json.decode(str).map((x) => GetToDoUniqueUserModel.fromMap(x)));

String getToDoUniqueUserModelToMap(List<GetToDoUniqueUserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class GetToDoUniqueUserModel {
  GetToDoUniqueUserModel({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
  });

  final String id;
  final String title;
  final String description;
  final String userId;

  factory GetToDoUniqueUserModel.fromMap(Map<String, dynamic> json) =>
      GetToDoUniqueUserModel(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "description": description,
        "user_id": userId,
      };
}
