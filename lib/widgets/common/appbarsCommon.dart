import 'package:flutter/material.dart';
import 'package:notely/utils/fonts.dart';

class AppBarCommon extends StatelessWidget {
  dynamic leadingIcon, title, actionIcon;
  AppBarCommon({
    super.key,
    this.leadingIcon,
    this.title,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leadingIcon,
      title: Text(
        title,
        style: Fonts.editNoteTitle.titleSmall,
      ),
      actions: [
        actionIcon,
      ],
    );
  }
}
