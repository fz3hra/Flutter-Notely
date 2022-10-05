import 'package:flutter/material.dart';
import 'package:notely/utils/colors.dart';

class Fonts {
  static const TextTheme onboardingTitle = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: "Titan-One",
      fontSize: 20.0,
      fontWeight: FontWeight.w900,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Nunito",
      fontSize: 24.0,
      fontWeight: FontWeight.w900,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Nunito-Bold",
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
  );

  static const TextTheme onboardingLinks = TextTheme(
    bodyMedium: TextStyle(
      fontFamily: "Nunito-Bold",
      fontSize: 16.0,
      fontWeight: FontWeight.w800,
      color: ColorsConstant.secondaryColor,
    ),
  );

  static const TextTheme hintTheme = TextTheme(
    bodyMedium: TextStyle(
      fontFamily: "Nunito-Bold",
      fontSize: 16.0,
      fontWeight: FontWeight.w800,
      color: ColorsConstant.hintTextColor,
    ),
    titleMedium: TextStyle(
      fontFamily: "Nunito-Bold",
      fontSize: 16.0,
      fontWeight: FontWeight.w800,
      color: ColorsConstant.TextTitleColor,
    ),
  );
}
