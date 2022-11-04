import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/views/startingRound.view.dart';

import '../components/FeaturesDrawer.component.dart';

class EndOfRoundView extends StatefulWidget {
  @override
  _EndOfRoundViewState createState() => _EndOfRoundViewState();
}

class _EndOfRoundViewState extends State<EndOfRoundView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('End of Round/Bonuses')),
          drawer: generateGameDrawer(context),
          body: Column(
            children: [
              const Text('Round 1 Results'),
              const OutlinedButton(onPressed: null, child: Text('+10')),
              const OutlinedButton(onPressed: null, child: Text('+20')),
              const OutlinedButton(onPressed: null, child: Text('Mermaid +20')),
              const OutlinedButton(onPressed: null, child: Text('Pirate +30')),
              const OutlinedButton(onPressed: null, child: Text('Skull King +50')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return StartingRoundView();
                    }));
                  },
                  child: const Text('Next Round!')),
            ],
          )),
    );
  }
}
