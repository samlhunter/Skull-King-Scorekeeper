import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/views/startingRound.view.dart';

class EndOfRoundView extends StatefulWidget {
  @override
  _EndOfRoundViewState createState() => _EndOfRoundViewState();
}

class _EndOfRoundViewState extends State<EndOfRoundView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('End of Round/Bonuses')),
        body: Container(
            child: Column(
          children: [
            Text('Round 1 Results'),
            OutlinedButton(onPressed: null, child: Text('+10')),
            OutlinedButton(onPressed: null, child: Text('+20')),
            OutlinedButton(onPressed: null, child: Text('Mermaid +20')),
            OutlinedButton(onPressed: null, child: Text('Pirate +30')),
            OutlinedButton(onPressed: null, child: Text('Skull King +50')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StartingRoundView();
                  }));
                },
                child: Text('Next Round!')),
          ],
        )),
      ),
    );
  }
}
