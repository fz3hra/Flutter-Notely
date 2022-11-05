import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/blocs/login_bloc/login_bloc.dart';
import 'package:notely/blocs/registration_bloc/registration_bloc.dart';
import 'package:notely/blocs/todo_bloc/create_todo_bloc/create_todo_bloc.dart';
import 'package:notely/blocs/todo_bloc/get_todo_unique_user/get_todo_unique_user_bloc.dart';
import 'package:notely/repository/todo_repository/create_todo_repository.dart';
import 'package:notely/repository/userAuth_repository/registrationRepository.dart';
import 'package:notely/screens/createNoteScreens/createNoteScreen.dart';
import 'package:notely/screens/homepageScreens/homepageScreen.dart';
import 'package:notely/screens/homepageScreens/noContentHomepage.dart';
import 'package:notely/screens/registrationScreens/registrationScreen.dart';

import 'repository/todo_repository/get_todo_unique_user_repository.dart';
import 'repository/userAuth_repository/loginRepository.dart';
import 'screens/loginScreens/loginScreen.dart';
import 'screens/onboardingScreens/onboardingScreen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<RegistrationBloc>(
        create: (BuildContext context) => RegistrationBloc(
          RegistrationRepository(),
        ),
      ),
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(
          LoginRepository(),
        ),
      ),
      BlocProvider<CreateTodoBloc>(
        create: (BuildContext context) => CreateTodoBloc(
          CreateTodoRepository(),
        ),
      ),
      BlocProvider<GetTodoUniqueUserBloc>(
        create: (BuildContext context) => GetTodoUniqueUserBloc(
          GetTodoUniqueUser(),
        ),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
        '/initial-homepage': (context) => NoContentHomePage(),
        '/homepage': (context) => HomePageScreen(),
        '/create-note': (context) => CreateNoteScreen(),
      },
    );
  }
}
