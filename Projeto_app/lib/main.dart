import 'package:flutter/material.dart';

import 'Login/welcome_Screen.dart';

void main() {//
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dental Insight App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}

//flutter run


