import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:notely/blocs/registration_bloc/registration_bloc.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/widgets/onboarding/onboardingButton.dart';
import 'package:notely/widgets/registration/registrationTextField.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late RegistrationBloc register;

  @override
  void initState() {
    register = BlocProvider.of<RegistrationBloc>(context);
    super.initState();
  }

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
                  "Create a free account",
                  style: Fonts.onboardingTitle.bodyLarge,
                ),
              ),
              const Gap(12),
              Text(
                "Join Notely for free. Create and share unlimited notes with your friends.",
                style: Fonts.onboardingTitle.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(62),
              RegistrationTextField(
                hintText: 'John Doe',
                textTitle: 'Full Name',
              ),
              const Gap(21),
              RegistrationTextField(
                hintText: 'JohnDoe@gmail.com',
                textTitle: 'Email Address',
              ),
              const Gap(21),
              RegistrationTextField(
                hintText: '######',
                textTitle: 'Password',
              ),
              const Gap(56),
              BlocListener<RegistrationBloc, RegistrationState>(
                listener: (context, state) {
                  // TODO: implement listener
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Container(
                        child: Text("Your request was successfull!"),
                      ),
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                          textColor: Colors.white,
                          label: 'Close',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          }),
                    ),
                  );
                },
                child: OnboardingButton(
                    title: "Create Account",
                    moveTo: "/initial-homepage",
                    onPressed: () async {
                      register.add(
                        RegisteringEvent(
                          name: "test1",
                          email: "test1@gmail.com",
                          password: "test123",
                        ),
                      );
                    }),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "Already have an account?",
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
