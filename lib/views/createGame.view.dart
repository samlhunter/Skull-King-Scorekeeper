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
        appBar: AppBar(title: Text('Create Game')),
        body: Container(
            child: Column(
          children: [
            Text('Add Yer Pirates!'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StartingRoundView();
                  }));
                },
                child: Text('Arrg!'))
          ],
        )),
      ),
    );
  }
}
