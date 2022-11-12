import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/betting.view.dart';
import 'package:delayed_display/delayed_display.dart';

class StartingRoundView extends StatefulWidget {
  @override
  _StartingRoundViewState createState() => _StartingRoundViewState();
}

class _StartingRoundViewState extends State<StartingRoundView> {
  final Duration initialDelay = Duration(milliseconds: 700);
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
                children: <Widget>[
                  Spacer(),
                  const Text(
                    'Get ready for round... 1!',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  DelayedDisplay(
                    delay: initialDelay,
                    child: const Text(
                      'YO',
                      style: TextStyle(fontSize: 64),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  DelayedDisplay(
                    delay:
                    Duration(milliseconds: initialDelay.inMilliseconds + 700),
                    child: const Text(
                      'HO',
                      style: TextStyle(fontSize: 64),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DelayedDisplay(
                    delay:
                    Duration(milliseconds: initialDelay.inMilliseconds + 1400),
                    child: const Text(
                      'HO',
                      style: TextStyle(fontSize: 64),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // TODO: later we will have an animation here for the countdown, but for right now just click button
                  ElevatedButton(
                    style:mainButton,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return BettingView();
                            }));
                      },
                      child: const Text('Continue')),
                  Spacer(),
                ],
              ),
            ),
          )
        )),
    );
  }
}
