import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/views/endOfRound.view.dart';

import '../components/FeaturesDrawer.component.dart';

class EnterResultsView extends StatefulWidget {
  @override
  _EnterResultsViewState createState() => _EnterResultsViewState();
}

class _EnterResultsViewState extends State<EnterResultsView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Enter Results')),
          drawer: generateGameDrawer(context),
          body: Column(
            children: [
              const Text('How\'d you do?'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EndOfRoundView();
                    }));
                  },
                  child: const Text('Round Results'))
            ],
          )),
    );
  }
}
