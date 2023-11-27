import 'package:flutter/material.dart';
import 'package:neuro_course/feature/auth/auth_page.dart';

import 'package:neuro_course/repos/models/colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorSchemeSeed: MainColors.mainPurple),
      home: const AuthPage(),
    );
  }
}
