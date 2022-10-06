import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/widgets/onboarding/onboardingButton.dart';
import 'package:notely/widgets/registration/registrationTextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34.0),
          child: Column(
            children: [
              const Gap(40),
              Center(
                child: Text(
                  "Notely",
                  style: Fonts.onboardingTitle.headlineLarge,
                ),
              ),
              const Gap(62),
              Center(
                child: Text(
                  "Welcome Back",
                  style: Fonts.onboardingTitle.bodyLarge,
                ),
              ),
              const Gap(12),
              Text(
                "Log into Notely to create and share unlimited notes with your friends.",
                style: Fonts.onboardingTitle.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(62),
              RegistrationTextField(
                hintText: 'JohnDoe@gmail.com',
                textTitle: 'Email Address',
              ),
              const Gap(21),
              RegistrationTextField(
                hintText: '######',
                textTitle: 'Password',
              ),
              const Gap(44),
              const OnboardingButton(
                  title: "Login", moveTo: "/initial-homepage"),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/registration');
                },
                child: Text(
                  "Don't have an account?",
                  style: Fonts.onboardingLinks.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
