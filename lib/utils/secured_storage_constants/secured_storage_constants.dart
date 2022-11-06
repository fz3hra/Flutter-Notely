import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class SecuredStorageConstants {
  static final storage = const FlutterSecureStorage();
  static Map<String, dynamic>? payload;
  static var readData;

  static Future<String?> readSecureData(String key) async {
    readData = await storage.read(key: key);
    return readData;
  }

  static Future<String?> readUserId(String key) async {
    readData = await storage.read(key: key);
    return readData;
  }

  static int getPayload(dynamic readData) {
    payload = Jwt.parseJwt(readData);
    var id = payload!["id"];
    return id;
  }
}
