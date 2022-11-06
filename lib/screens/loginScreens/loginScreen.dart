import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:notely/blocs/login_bloc/login_bloc.dart';
import 'package:notely/controllers/registrationController/registrationController.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/widgets/onboarding/onboardingButton.dart';
import 'package:notely/widgets/registration/registrationTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController fullNameController,
      emailController,
      passwordController;
  late LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
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
                  controller: emailController,
                  errorText: "",
                  obscureText: false,
                  onChanged: (text) {},
                ),
                const Gap(21),
                RegistrationTextField(
                  hintText: '######',
                  textTitle: 'Password',
                  controller: passwordController,
                  errorText: '',
                  obscureText: true,
                  onChanged: (text) {},
                ),
                const Gap(44),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Navigator.pushNamed(context, '/initial-homepage');
                    } else {
                      // TODO: add snackbar
                      print("cannot navigate from login");
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return OnboardingButton(
                        title: "Login",
                        // moveTo: "/initial-homepage",
                        onPressed: () async {
                          loginBloc.add(
                            LoginingEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
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
      ),
    );
  }
}
