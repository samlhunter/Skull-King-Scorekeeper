import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/createGame.view.dart';
import 'package:skull_king_scorekeeper/views/enterResults.view.dart';

import '../../main.dart';
import '../../utils/buttons.dart';

class RulesView extends StatefulWidget {
  @override
  _RulesViewState createState() => _RulesViewState();
}

class _RulesViewState extends State<RulesView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: mainDecoration,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                    child: Column(
                  children: [
                    Spacer(),
                    const Text(
                      'RULES FOR SCORING',
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    const Text(
                      'A Bid or One or More Tricks: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                        'Correct bid: +20 points for each trick bid and taken'),
                    const Text(
                      'IncorrectBid: -10 points times the number of tricks above or below bid',
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    const Text(
                      'Zero Bid: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                        'Correct bid: Score ten tiemes the nubmer of cards dealt each player that round',
                        textAlign: TextAlign.center,
                        ),

                    const Text(
                      'IncorrectBid: Deduct tem times the number of cards dealt each player that round',
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                                        const Text(
                      'Bonus Points: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                        'Capture a 14: +10 for standard suits, +20 for 14 Jolly Roger',
                        textAlign: TextAlign.center,
                        ),

                    const Text(
                      'Capture a Pirate with the Skull King: +30 points for each Pirate Captured by Skull Kingf',
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    ElevatedButton(
                        style: mainButton,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Return to Game')),
                    Spacer(),
                  ],
                )),
              ))),
    );
  }
}
