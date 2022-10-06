import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/widgets/common/appbarsCommon.dart';
import 'package:notely/widgets/editNote/editNoteTextField.dart';
import 'package:notely/widgets/registration/registrationTextField.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: AppBarCommon(
            leadingIcon: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: "Edit Note",
            actionIcon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            const Gap(30),
            EditNoteTextField(
              hintText: "Note title",
            ),
            const Gap(12),
            Expanded(
              child: EditNoteTextField(
                hintText: "Note Content",
                height: MediaQuery.of(context).size.height,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
