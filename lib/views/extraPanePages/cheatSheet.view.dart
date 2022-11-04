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
          appBar: AppBar(title: const Text('Cheat Sheet')),
          body: Column(
            children: [
              const Text('Back to Game'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to Game'))
            ],
          )),
    );
  }
}
