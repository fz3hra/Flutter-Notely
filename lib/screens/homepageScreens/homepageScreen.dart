import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: add login:: if has notes, then show homepage screen with notes, or otherwise show noContentHomePage
    return SafeArea(
      child: Scaffold(
        body: Column(),
      ),
    );
  }
}
