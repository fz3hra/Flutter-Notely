import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:notely/blocs/registration_bloc/registration_bloc.dart';
import 'package:notely/controllers/registrationController/registrationController.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/utils/registrationConstants/registrationConstants.dart';
import 'package:notely/widgets/onboarding/onboardingButton.dart';
import 'package:notely/widgets/registration/registrationTextField.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late RegistrationBloc register;
  RegistrationController registrationController = RegistrationController();
  String? setFullNameText = "";
  String? setEmailText = "";
  // String? setPasswordText = "";

  @override
  void initState() {
    register = BlocProvider.of<RegistrationBloc>(context);
    RegistrationConstants.fullNameController = TextEditingController();
    RegistrationConstants.emailController = TextEditingController();
    RegistrationConstants.passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    RegistrationConstants.fullNameController.dispose();
    RegistrationConstants.emailController.dispose();
    RegistrationConstants.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
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
                  controller: RegistrationConstants.fullNameController,
                  errorText: registrationController.errorTextFullName,
                  onChanged: (text) {
                    setState(() {
                      setFullNameText = text;
                    });
                  },
                  obscureText: false,
                ),
                const Gap(21),
                RegistrationTextField(
                  hintText: 'JohnDoe@gmail.com',
                  textTitle: 'Email Address',
                  controller: RegistrationConstants.emailController,
                  errorText: registrationController.errorTextEmailAddress,
                  onChanged: (text) {
                    setState(() {
                      setEmailText = text;
                    });
                  },
                  obscureText: false,
                ),
                const Gap(21),
                RegistrationTextField(
                  hintText: '######',
                  textTitle: 'Password',
                  controller: RegistrationConstants.passwordController,
                  errorText: "",
                  onChanged: (text) {
                    // setState(() {
                    //   setPasswordText = text;
                    // });
                  },
                  obscureText: true,
                ),
                const Gap(56),
                BlocListener<RegistrationBloc, RegistrationState>(
                  listener: (context, state) {
                    if (state is RegistrationSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/initial-homepage', (route) => false);
                    } else {
                      print("UNABLE");
                    }
                  },
                  child: BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      if (state is RegistrationError) {
                        // TODO: SHOW snackbar
                        print("cannot create user");
                      }
                      return OnboardingButton(
                        title: "Create Account",
                        // moveTo: "/initial-homepage",
                        onPressed: () async {
                          register.add(
                            RegisteringEvent(
                              name:
                                  RegistrationConstants.fullNameController.text,
                              email: RegistrationConstants.emailController.text,
                              password:
                                  RegistrationConstants.passwordController.text,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                // ),
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
      ),
    );
  }
}
