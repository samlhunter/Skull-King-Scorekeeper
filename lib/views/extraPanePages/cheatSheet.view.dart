import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/betting.view.dart';
import 'package:skull_king_scorekeeper/views/createGame.view.dart';
import 'package:skull_king_scorekeeper/views/enterResults.view.dart';

import '../../main.dart';
import '../../utils/buttons.dart';

class CheatSheetView extends StatefulWidget {
  @override
  _CheatSheetViewState createState() => _CheatSheetViewState();
}

class _CheatSheetViewState extends State<CheatSheetView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: mainDecoration,
          child: Scaffold(
            backgroundColor: Colors.transparent,
              body: Center(
                child:Column(
                  children: [
                    Spacer(),
                    const Text(
                      'CHEAT SHEET',
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    const Text(
                      'Purple, Yellow and Green cards are the Standard suits',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    const Text(
                      'Black (Jolly Roger) cards defeat all other suits',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    const Text(
                      'The Blue cards with the White Flags are escape cards',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    const Text(
                      'Pirate Cards defeat all other cards except other Pirates',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    const Text(
                      'The Tigress card can be either Escape or Pirate',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    const Text(
                      'The Skull King defeats all Pirates',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
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
                        Spacer(),
                  ],
                )),
              )
        )
      ),
    );
  }
}
