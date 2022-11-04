import 'package:flutter/material.dart';

class PreviousRoundsView extends StatefulWidget {
  @override
  _PreviousRoundsViewState createState() => _PreviousRoundsViewState();
}

class _PreviousRoundsViewState extends State<PreviousRoundsView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Previous Rounds')),
        body: Container(
            child: Column(
          children: [Text('Previous Rounds')],
        )),
      ),
    );
  }
}
