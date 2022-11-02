import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:notely/blocs/todo_bloc/create_todo_bloc/create_todo_bloc.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/widgets/common/appbarsCommon.dart';
import 'package:notely/widgets/editNote/editNoteTextField.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  late TextEditingController noteTitle, noteContent;
  late CreateTodoBloc createTodoBloc;

  @override
  void initState() {
    createTodoBloc = BlocProvider.of<CreateTodoBloc>(context);
    noteTitle = TextEditingController();
    noteContent = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    noteTitle.dispose();
    noteContent.dispose();
    super.dispose();
  }

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
              controller: noteTitle,
              hintText: "Note title",
            ),
            const Gap(12),
            Expanded(
              child: EditNoteTextField(
                controller: noteContent,
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
