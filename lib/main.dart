import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/initialScreen.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skull King Scorekeeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitialScreenView(),
    );
  }
}
