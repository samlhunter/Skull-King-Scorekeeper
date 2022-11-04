import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/views/betting.view.dart';

class StartingRoundView extends StatefulWidget {
  @override
  _StartingRoundViewState createState() => _StartingRoundViewState();
}

class _StartingRoundViewState extends State<StartingRoundView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Starting Round...')),
          body: Column(
            children: [
              const Text('Get ready for round... 1!'),
              const Text(
                'YO',
                style: TextStyle(fontSize: 64),
              ),
              const Text(
                'HO',
                style: TextStyle(fontSize: 64),
              ),
              const Text(
                'HO!',
                style: TextStyle(fontSize: 64),
              ),
              // TODO: later we will have an animation here for the countdown, but for right now just click button
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BettingView();
                    }));
                  },
                  child: const Text('(Continue)'))
            ],
          )),
    );
  }
}
