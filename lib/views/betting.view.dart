import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/components/FeaturesDrawer.component.dart';
import 'package:skull_king_scorekeeper/views/enterResults.view.dart';

class BettingView extends StatefulWidget {
  @override
  _BettingViewState createState() => _BettingViewState();
}

class _BettingViewState extends State<BettingView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Betting')),
          drawer: generateGameDrawer(context),
          body: Column(
            children: [
              const Text('Place Yer Bets'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EnterResultsView();
                    }));
                  },
                  child: const Text('Submit Bets'))
            ],
          )),
    );
  }
}
