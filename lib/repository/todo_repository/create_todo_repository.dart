import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notely/models/todoModels/create_todo_models.dart';
import 'package:notely/utils/apiConstants/apiConstant.dart';

class CreateTodoRepository {
  Future<CreateTodoModel?> createTodos(
    String title,
    String description,
  ) async {
    try {
      var url = Uri.parse(ApiConstant.baseUrl + ApiConstant.createTodoEndPoint);
      CreateTodoModel todoModel = CreateTodoModel(
        title: title,
        description: description,
        id: '',
      );

      http.Response res = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(todoModel.toMap()),
      );

      if (res.statusCode == 200) {
        print(CreateTodoModel.fromMap(jsonDecode(res.body)));
        return CreateTodoModel.fromMap(jsonDecode(res.body));
      } else {
        print("Failed to create todos");
      }
    } catch (e, s) {
      print("exception $e");
      print("strack $s");
      rethrow;
    }
  }
}
