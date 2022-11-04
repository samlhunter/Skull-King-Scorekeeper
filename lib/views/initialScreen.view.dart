import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/views/createGame.view.dart';

class InitialScreenView extends StatefulWidget {
  @override
  _InitialScreenViewState createState() => _InitialScreenViewState();
}

class _InitialScreenViewState extends State<InitialScreenView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Start')),
          body: Column(
            children: [
              const Text('Welcome to Skull King Scorekeeper!'),
              const Text('Here you can create a new game!'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CreateGameView();
                    }));
                  },
                  child: const Text('Create New Game')),
              const OutlinedButton(
                  onPressed: null, child: Text('Continue Previous Game')), // null onPressed == disabled button
            ],
          )),
    );
  }
}
