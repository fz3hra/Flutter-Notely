import 'package:flutter/material.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';

class EditNoteTextField extends StatelessWidget {
  final TextEditingController controller;
  dynamic hintText, height, keyboardType, hintStyle, fontStyle;
  EditNoteTextField({
    required this.controller,
    super.key,
    this.hintText,
    this.height,
    this.keyboardType,
    this.hintStyle,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: height,
      child: TextField(
        minLines: 1, // <-- SEE HERE
        maxLines: null,
        controller: controller,
        style: fontStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: true,
          fillColor: ColorsConstant.backgroundColor,
        ),
      ),
    );
  }
}
