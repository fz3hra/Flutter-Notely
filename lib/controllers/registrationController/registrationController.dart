import 'package:notely/utils/registrationConstants/registrationConstants.dart';

class RegistrationController {
  String? get errorTextFullName {
    final fullNameControllerText =
        RegistrationConstants.fullNameController.value.text;

    if (fullNameControllerText.isEmpty) {
      return 'Can not be empty';
    }
    if (fullNameControllerText.length < 5) {
      return 'Text too short';
    }
  }

  String? get errorTextEmailAddress {
    final emailControllerText =
        RegistrationConstants.emailController.value.text;

    if (emailControllerText.isEmpty) {
      return 'Can not be empty';
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailControllerText);

    if (!emailValid) {
      return 'Not a valid email address';
    }
  }

  String? get errorTextPassword {
    final passwordControllerText =
        RegistrationConstants.passwordController.value.text;

    if (passwordControllerText.isEmpty) {
      return 'Can not be empty';
    }

    if (passwordControllerText.length < 6) {
      return 'Password is too short';
    }
  }
}
