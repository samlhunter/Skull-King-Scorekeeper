import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';

class PreviousRoundsView extends StatefulWidget {
  @override
  _PreviousRoundsViewState createState() => _PreviousRoundsViewState();
}

class _PreviousRoundsViewState extends State<PreviousRoundsView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // body: Container(
          //     decoration: mainDecoration,
          //     child: Scaffold(
          //         backgroundColor: Colors.transparent, body: Center()))),
          body: Center(
              child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: Table(
            defaultColumnWidth: FixedColumnWidth(120.0),
            border: TableBorder.all(
                color: Colors.black, style: BorderStyle.solid, width: 2),
            children: [
              TableRow(children: [
                Column(children: [
                  Text('Website', style: TextStyle(fontSize: 20.0))
                ]),
                Column(children: [
                  Text('Tutorial', style: TextStyle(fontSize: 20.0))
                ]),
                Column(children: [
                  Text('Review', style: TextStyle(fontSize: 20.0))
                ]),
              ]),
              TableRow(children: [
                Column(children: [Text('Javatpoint')]),
                Column(children: [Text('Flutter')]),
                Column(children: [Text('5*')]),
              ]),
              TableRow(children: [
                Column(children: [Text('Javatpoint')]),
                Column(children: [Text('MySQL')]),
                Column(children: [Text('5*')]),
              ]),
              TableRow(children: [
                Column(children: [Text('Javatpoint')]),
                Column(children: [Text('ReactJS')]),
                Column(children: [Text('5*')]),
              ]),
            ],
          ),
        ),
      ]))),
    );
  }
}
