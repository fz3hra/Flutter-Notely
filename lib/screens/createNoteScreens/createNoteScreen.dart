import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:notely/blocs/todo_bloc/create_todo_bloc/create_todo_bloc.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/utils/fonts.dart';
import 'package:notely/utils/secured_storage_constants/secured_storage_constants.dart';
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
  final _storage = const FlutterSecureStorage();
  var test;
  String? userId;
  @override
  void initState() {
    createTodoBloc = BlocProvider.of<CreateTodoBloc>(context);
    noteTitle = TextEditingController();
    noteContent = TextEditingController();
    super.initState();
    getPayload();
    getUserId();
  }

  void getPayload() async {
    String? token = await _storage.read(key: "KEY_TOKEN");
    test = token;
    if (test != null) {
      dynamic id = (Jwt.parseJwt(test!))["id"];
      setState(() {
        userId = id;
      });
    }
  }

  void getUserId() async {
    String? user_id = await _storage.read(key: "KEY_USERID");
    if (user_id != null) {
      setState(() {
        userId = user_id;
      });
    }
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
            title: "Add Note",
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
              fontStyle: Fonts.onboardingTitle.bodyLarge,
              hintStyle: Fonts.onboardingTitle.bodyLarge,
            ),
            const Gap(12),
            Expanded(
              child: EditNoteTextField(
                controller: noteContent,
                hintText: "Note Content",
                height: MediaQuery.of(context).size.height,
                keyboardType: TextInputType.multiline,
                fontStyle: const TextStyle(
                  fontFamily: "Nunito-Bold",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
                hintStyle: const TextStyle(
                  fontFamily: "Nunito-Bold",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: BlocListener<CreateTodoBloc, CreateTodoState>(
          listener: (context, state) {
            if (state is CreateTodoSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/homepage', (route) => false);
            } else {
              print("UNABLE");
            }
          },
          child: BlocBuilder<CreateTodoBloc, CreateTodoState>(
            builder: (context, state) {
              return FloatingActionButton(
                backgroundColor: ColorsConstant.secondaryColor,
                child: const Icon(Icons.save),
                onPressed: () async {
                  createTodoBloc.add(CreatingTodoEvent(
                    noteUserId: userId!,
                    noteTitle: noteTitle.text,
                    noteContent: noteContent.text,
                  ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
