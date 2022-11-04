import 'package:flutter/material.dart';

class RulesView extends StatefulWidget {
  @override
  _RulesViewState createState() => _RulesViewState();
}

class _RulesViewState extends State<RulesView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Rules')),
          body: Column(
            children: [
              const Text('Rules'),
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
