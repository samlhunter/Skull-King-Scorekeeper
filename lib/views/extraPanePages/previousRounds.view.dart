import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/models/game.models.dart';

class PreviousRoundsView extends StatefulWidget {
  @override
  _PreviousRoundsViewState createState() => _PreviousRoundsViewState();
}

class _PreviousRoundsViewState extends State<PreviousRoundsView> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameModel>();
   // var player = context.watch<Player>();
   log('previous Rounds State object was hit');
   print('HEre is the game object: ${game.players}');
    return MaterialApp(
      home: Scaffold(
          // body: Container(
          //     decoration: mainDecoration,
          //     child: Scaffold(
          //         backgroundColor: Colors.transparent, body: Center()))),
          body: Container(
              decoration: mainDecoration,
              child: Column(children: <Widget>[
        Spacer(),
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Table(
            defaultColumnWidth: FixedColumnWidth(120.0),
            border: TableBorder.all(color: Colors.black, style: BorderStyle.solid, width: 2),
                //itemCount: game.players.length,
            children: [
              TableRow(children: [
                 Column(children: [
                  Text('Round', style: TextStyle(fontSize: 20.0))
                ]),
                Column(children: [
                  Text(game.players.toString(), style: TextStyle(fontSize: 20.0))
                ]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('10')]),//This will be teh score of player [0]
              ]),
              // TableRow(children: [
              //   Column(children: [Text('Javatpoint')]),
              //   Column(children: [Text('MySQL')]),
              //   Column(children: [Text('5*')]),
              //    Column(children: [Text('5*')]),
              // ]),
              // TableRow(children: [
              //   Column(children: [Text('Javatpoint')]),
              //   Column(children: [Text('ReactJS')]),
              //   Column(children: [Text('5*')]),
              //    Column(children: [Text('5*')]),
              // ]),
              //  TableRow(children: [
              //   Column(children: [Text('Javatpoint')]),
              //   Column(children: [Text('ReactJS')]),
              //   Column(children: [Text('5*')]),
              //    Column(children: [Text('5*')]),
              // ]),
            ],
          ),
        ),
        Spacer()
      ]))),
    );
  }
}
