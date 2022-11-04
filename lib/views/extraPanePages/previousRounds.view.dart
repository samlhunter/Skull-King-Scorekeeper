import 'package:flutter/material.dart';

class PreviousRoundsView extends StatefulWidget {
  @override
  _PreviousRoundsViewState createState() => _PreviousRoundsViewState();
}

class _PreviousRoundsViewState extends State<PreviousRoundsView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Previous Rounds')),
          body: Column(
            children: [
              const Text('Previous Rounds'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to Game'))
            ],
          )),
    );
  }
}
