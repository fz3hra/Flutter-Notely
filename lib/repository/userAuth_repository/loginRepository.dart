import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notely/models/userModels/userLoginModel.dart';
import 'package:notely/utils/apiConstants/apiConstant.dart';

// TODO: when user logs in, store user_id, and token in shared preferences
// Understand: JWT is used to store a user session

class LoginRepository {
  Future<UserLoginModel?> loginUsers(
    String email,
    String password,
  ) async {
    try {
      var url = Uri.parse(ApiConstant.loginbaseUrl + ApiConstant.loginEndPoint);
      UserLoginModel usermodel = UserLoginModel(
        token: '',
        id: '',
        email: email,
        name: '',
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
        // TODO : store res.body in secure storage
        print("gettingRequest ${res.body}");
        return UserLoginModel.fromMap(jsonDecode(res.body));
      } else {
        print("Failed to login user");
      }
    } catch (e, s) {
      print("exception $e");
      print("strack $s");
      rethrow;
    }
  }
}
