import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/models/game.models.dart';

import '../../utils/buttons.dart';
import '../betting.view.dart';

class PreviousRoundsView extends StatefulWidget {
  @override
  _PreviousRoundsViewState createState() => _PreviousRoundsViewState();
}

class _PreviousRoundsViewState extends State<PreviousRoundsView> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameModel>();
    // var player = context.watch<Player>();
    print('HEre is the game object: ${game.players}');
    var playerList = game.players;
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
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    //itemCount: game.players.length,
                    children: [
                      TableRow(children: [
                        Column(children: [
                          Text('Round', style: TextStyle(fontSize: 20.0))
                        ]),
                        for (int i = 0; i < playerList.length; i++)
                          Column(children: [
                            Text(playerList[i].name.toString(),
                                style: TextStyle(fontSize: 20.0))
                          ]),
                      ]),
                      for (int i = 1; i <= 10; i++)
                        TableRow(children: [
                          Column(children: [Text(i.toString())]),
                          for (int j = 0; j < playerList.length; j++)
                            Column(children: [
                               if(i <= game.roundNumber)
                              Text(playerList[j].calcScore().toString())
                              else
                              Text('--')
                            ]),

                        ]),
                    ],
                  ),
                ),
                Spacer(),
                    ElevatedButton(
                        style: mainButton,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, 
                              MaterialPageRoute(builder: (context) {
                                return (BettingView());
                              }));
                        },
                        child: const Text('Return to Game')),
                Spacer()
              ]))),
    );
  }
}
