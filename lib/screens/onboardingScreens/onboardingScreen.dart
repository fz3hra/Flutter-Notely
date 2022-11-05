import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notely/screens/homepageScreens/homepageScreen.dart';
import 'package:notely/utils/secured_storage_constants/secured_storage_constants.dart';
import 'package:notely/widgets/onboard.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Widget _currentPage = const OnBoard();
  final _storage = const FlutterSecureStorage();
  var results;
  SecuredStorageConstants securedStorageConstants = SecuredStorageConstants();
  @override
  void initState() {
    // _delete();
    super.initState();
    _readFromStorage();
    // results = SecuredStorageConstants.readSecureData("KEY_TOKEN");
  }

  int payload = 0;
  String? t;
  // ! get token here:

  void _readFromStorage() async {
    String? token = await _storage.read(key: "KEY_TOKEN");
    t = token;
    if (token != null) {
      setState(() {
        _currentPage = HomePageScreen();
      });
    }
  }

  // void _delete() async {
  //   await _storage.deleteAll();
  // }

  @override
  Widget build(BuildContext context) {
    // return results != null ? HomePageScreen() : const OnBoard();
    return _currentPage;
  }
}
