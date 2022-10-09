import 'package:flutter/material.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';

class OnboardingButton extends StatelessWidget {
  final String title, moveTo;
  dynamic onPressed;
  OnboardingButton(
      {Key? key, required this.title, required this.moveTo, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          primary: ColorsConstant.secondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        // () {
        //   // Navigator.pushNamed(context, moveTo);
        // },
        child: Text(
          title,
          style: Fonts.onboardingTitle.bodyLarge,
        ),
      ),
    );
  }
}
