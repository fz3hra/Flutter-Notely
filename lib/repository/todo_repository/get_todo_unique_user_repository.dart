import 'dart:convert';
import 'dart:io';

import 'package:notely/models/todoModels/get_todo_unique_user_models.dart';
import 'package:notely/utils/apiConstants/apiConstant.dart';
import "package:http/http.dart" as http;
import 'package:notely/utils/secured_storage_constants/secured_storage_constants.dart';

class GetTodoUniqueUser {
  Future<List<GetToDoUniqueUserModel>> getTodoUniqueUsers() async {
    try {
      // !LOGIN user
      var payload;
      final String? _baseUrl;
      final String _baseUrlRegistered;
      var response;
      var token = await SecuredStorageConstants.readSecureData("KEY_TOKEN");
      var userID = await SecuredStorageConstants.readSecureData("KEY_USERID");
      if (token != null) {
        payload = parseJwt(token);
        _baseUrl = ApiConstant.baseUrl +
            ApiConstant.getTodoUniqueUserEndPoint +
            payload["id"];
        response = await http.get(
          Uri.parse(_baseUrl),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          },
        );
      } else {
        // ! Registered use
        _baseUrlRegistered = ApiConstant.baseUrl +
            ApiConstant.getTodoUniqueUserEndPoint +
            userID!;
        response = await http.get(
          Uri.parse(_baseUrlRegistered),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          },
        );
      }
      List<GetToDoUniqueUserModel> model = [];
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        for (var json in res) {
          model.add(GetToDoUniqueUserModel.fromMap(json));
        }
        return model;
      } else {
        throw Exception("Failed to load json");
      }
    } catch (e, s) {
      print("exception $e");
      print("exception $s");
      rethrow;
    }
  }
}

Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }
  print("payloadMap $payloadMap");
  return payloadMap;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}
