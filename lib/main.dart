import 'package:flutter/material.dart';
import 'package:notely/screens/createNoteScreens/createNoteScreen.dart';
import 'package:notely/screens/homepageScreens/homepageScreen.dart';
import 'package:notely/screens/homepageScreens/noContentHomepage.dart';
import 'package:notely/screens/registrationScreens/registrationScreen.dart';

import 'screens/loginScreens/loginScreen.dart';
import 'screens/onboardingScreens/onboardingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
        '/initial-homepage': (context) => NoContentHomePage(),
        '/homepage': (context) => HomePageScreen(),
        '/create-note': (context) => CreateNoteScreen(),
      },
    );
  }
}
