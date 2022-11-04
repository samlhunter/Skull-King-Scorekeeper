import 'package:flutter/material.dart';

class CheatSheetView extends StatefulWidget {
  @override
  _CheatSheetViewState createState() => _CheatSheetViewState();
}

class _CheatSheetViewState extends State<CheatSheetView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Cheat Sheet')),
        body: Container(
            child: Column(
          children: [Text('Cheat Sheet')],
        )),
      ),
    );
  }
}
