import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:notely/screens/loginScreens/loginScreen.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/widgets/common/appbarsCommon.dart';
import 'package:notely/widgets/no-content/no_content_widget.dart';
import 'package:notely/widgets/onboarding/onboardingButton.dart';

class NoContentHomePage extends StatefulWidget {
  const NoContentHomePage({super.key});

  @override
  State<NoContentHomePage> createState() => _NoContentHomePageState();
}

class _NoContentHomePageState extends State<NoContentHomePage> {
  @override
  Widget build(BuildContext context) {
    return NoContentWidget();
  }
}
