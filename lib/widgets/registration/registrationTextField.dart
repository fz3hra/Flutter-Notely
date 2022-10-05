import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/utils/fonts.dart';

class RegistrationTextField extends StatelessWidget {
  final String textTitle, hintText;
  const RegistrationTextField({
    Key? key,
    required this.textTitle,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textTitle, style: Fonts.hintTheme.titleMedium),
        const Gap(8),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Fonts.hintTheme.bodyMedium,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
