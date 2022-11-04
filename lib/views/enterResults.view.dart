import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/views/endOfRound.view.dart';

class EnterResultsView extends StatefulWidget {
  @override
  _EnterResultsViewState createState() => _EnterResultsViewState();
}

class _EnterResultsViewState extends State<EnterResultsView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Enter Results')),
        body: Container(
            child: Column(
          children: [
            Text('How\'d you do?'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EndOfRoundView();
                  }));
                },
                child: Text('Round Results'))
          ],
        )),
      ),
    );
  }
}
