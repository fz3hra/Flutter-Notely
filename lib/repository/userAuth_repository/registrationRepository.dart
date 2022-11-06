import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notely/models/userModels/userModel.dart';
import 'package:notely/utils/apiConstants/apiConstant.dart';

class RegistrationRepository {
  Future<UserModel?> createUsers(
    String name,
    String email,
    String password,
  ) async {
    try {
      var url =
          Uri.parse(ApiConstant.baseUrl + ApiConstant.registrationEndPoint);
      UserModel usermodel = UserModel(
        id: '',
        email: email,
        name: name,
        password: password,
        type: '',
      );

      http.Response res = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(usermodel.toMap()),
      );

      if (res.statusCode == 200) {
        return UserModel.fromMap(jsonDecode(res.body));
      } else {
        print("Failed to create user");
      }
    } catch (e, s) {
      print("exception $e");
      print("strack $s");
      rethrow;
    }
  }
}
