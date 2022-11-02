import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:notely/models/onboardingModels/onboardingModel.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/widgets/no-content/no_content_widget.dart';
import 'package:notely/widgets/onboard.dart';
import 'package:notely/widgets/onboarding/onboardingButton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Widget _currentPage = const OnBoard();
  final _storage = const FlutterSecureStorage();

  @override
  void initState() {
    // _delete();
    super.initState();
    _readFromStorage();
  }

  void _readFromStorage() async {
    String? token = await _storage.read(key: "KEY_TOKEN");
    if (token != null) {
      setState(() {
        _currentPage = const NoContentWidget();
      });
    }
  }

  // void _delete() async {
  //   await _storage.deleteAll();
  // }

  @override
  Widget build(BuildContext context) {
    return _currentPage;
  }
}
