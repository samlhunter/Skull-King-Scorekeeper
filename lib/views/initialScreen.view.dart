import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/createGame.view.dart';

import '../main.dart';
import '../utils/buttons.dart';

class InitialScreenView extends StatefulWidget {
  @override
  _InitialScreenViewState createState() => _InitialScreenViewState();
}

class _InitialScreenViewState extends State<InitialScreenView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
              body: Center(
                child:Column(
                  children: [
                    Spacer(
                        flex:2
                    ),
                    const Text(
                      'Welcome to Skull King Scorekeeper!',
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    const Text(
                      'Here you can create a new game or resume a previous one!',
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
                                return CreateGameView();
                              }));
                        },
                        child: const Text('Create New Game')),
                    OutlinedButton(
                        onPressed: null,
                        child: Text(
                            'Continue Previous Game')), // null onPressed == disabled button
                    Spacer()
                  ],
                )),
              )
        )
      ),
    );
  }
}
