import 'package:flutter/material.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';

class EditNoteTextField extends StatelessWidget {
  dynamic hintText, height, keyboardType;
  EditNoteTextField({
    super.key,
    this.hintText,
    this.height,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: height,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Fonts.hintTheme.bodyMedium,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: true,
          fillColor: ColorsConstant.backgroundColor,
        ),
      ),
    );
  }
}
