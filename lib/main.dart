import 'package:flutter/material.dart';

import 'package:money_manager_v2/Screens/SplashScreen.dart';

const SAVE_KEY_NAME = "UserLoggedIn";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      home: const SplashScreen(),
    );
  }
}
