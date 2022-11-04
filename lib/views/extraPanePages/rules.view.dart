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
        appBar: AppBar(title: Text('Rules')),
        body: Container(
            child: Column(
          children: [Text('Rules')],
        )),
      ),
    );
  }
}
