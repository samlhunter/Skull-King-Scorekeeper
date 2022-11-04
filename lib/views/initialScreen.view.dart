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
        appBar: AppBar(title: Text('Start')),
        body: Container(
            child: Column(
          children: [
            Text('Welcome to Skull King Scorekeeper!'),
            Text('Here you can create a new game!'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CreateGameView();
                  }));
                },
                child: Text('Create New Game')),
            OutlinedButton(onPressed: null, child: Text('Continue Previous Game')), // null onPressed == disabled button
          ],
        )),
      ),
    );
  }
}
