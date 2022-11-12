import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
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
          appBar: AppBar(
              title: const Text('End of Round/Bonuses'),
            backgroundColor: Colors.black,
            centerTitle: true,),
          drawer: generateGameDrawer(context),
          body: Container(
            decoration: mainDecoration,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body:Center(
                child: Column(
                  children: [
                    SizedBox(height: 25,),

                    const Text('Round 1 Results'),
                    const OutlinedButton(onPressed: null, child: Text('+10')),
                    const OutlinedButton(onPressed: null, child: Text('+20')),
                    const OutlinedButton(onPressed: null, child: Text('Mermaid +20')),
                    const OutlinedButton(onPressed: null, child: Text('Pirate +30')),
                    const OutlinedButton(onPressed: null, child: Text('Skull King +50')),
                    ElevatedButton(
                      style: mainButton,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return StartingRoundView();
                          }));
                        },
                        child: const Text('Next Round!')),
                    SizedBox(height: 25,),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
