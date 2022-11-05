import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:notely/utils/secured_storage_constants/secured_storage_constants.dart';
import 'dart:convert';

class ApiConstant {
  var token = SecuredStorageConstants.readSecureData("KEY_TOKEN");
  static String baseUrl = "https://zaah-test-fz3hra.vercel.app";
  static String registrationEndPoint = "/api/signup";

  static String loginEndPoint = "/api/signin";

  static String createTodoEndPoint = "/api/createTodo";

  static String getTodoUniqueUserEndPoint = "/api/get-todos/";
}
