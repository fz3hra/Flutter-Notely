import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/utils/fonts.dart';

class RegistrationTextField extends StatelessWidget {
  final String textTitle, hintText;
  final TextEditingController controller;
  final String? errorText;
  final Function(String?) onChanged;
  final bool obscureText;
  RegistrationTextField({
    Key? key,
    required this.textTitle,
    required this.hintText,
    required this.controller,
    required this.errorText,
    required this.onChanged,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textTitle, style: Fonts.hintTheme.titleMedium),
        const Gap(8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            errorText: errorText,
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
          onChanged: onChanged,
        ),
      ],
    );
  }
}
