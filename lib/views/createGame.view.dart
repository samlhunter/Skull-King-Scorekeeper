import 'package:flutter/material.dart';
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
                // crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  const Text(
                      'Add Yer Pirates!',
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                  ),

                  ElevatedButton(
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
