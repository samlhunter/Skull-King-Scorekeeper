import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/startingRound.view.dart';

class CreateGameView extends StatefulWidget {
  @override
  _CreateGameViewState createState() => _CreateGameViewState();
}

class _CreateGameViewState extends State<CreateGameView> {
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
                // crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Spacer(),
                  const Text(
                      'Add Yer Pirates!',
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                  ),

                  ElevatedButton(
                    style: mainButton,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return StartingRoundView();
                        }));
                      },
                      child: const Text('Arrg!')),
                  Spacer(),
                ],
              )),
            ),
          )
        )
    );
  }
}
