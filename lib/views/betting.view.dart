import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/components/FeaturesDrawer.component.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/views/enterResults.view.dart';

import '../utils/constants.dart';

class BettingView extends StatefulWidget {
  @override
  _BettingViewState createState() => _BettingViewState();
}

class _BettingViewState extends State<BettingView> {
  //Get list of players from presenter
  final List<String> players = <String>[
    'Josh',
    'Corban',
    'Blake',
    'Britton',
    'Ignacio'
  ];
  final List<int> colorCodes = <int>[600, 600, 600, 600, 600];
  final List<int> bets = <int>[0, 0, 0, 0, 0];
  //get round number from presenter
  int roundNumber = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Round $roundNumber - Bets'),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          drawer: generateGameDrawer(context),
          body: Container(
            decoration: mainDecoration,
            child: Scaffold(
              backgroundColor: Colors.transparent,
                body: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      const Text(
                        'Place Yer Bets',
                        style: TextStyle(fontSize: 40),
                      ),
                      Flexible(
                        flex: 5,
                          child: ListView.separated(
                            padding: const EdgeInsets.all(8),
                            itemCount: players.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  children: [
                                    if(index == 0) ...[
                                      Row(
                                        children: const [
                                          Text("Player", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                          Spacer(flex: 9,),
                                          Text("Bet", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                          Spacer(flex: 5,),
                                        ],
                                      ),
                                    ],
                                    Row(children: [
                                      Text('${players[index]}'),
                                      Spacer(flex: 8,),
                                      Text('${bets[index]}'),
                                      Spacer(flex: 1,),
                                      Ink(
                                        decoration: const ShapeDecoration(
                                          shape: CircleBorder(),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(Icons.add_circle_outline),
                                          color: Colors.black,
                                          onPressed: () {
                                            setState(() {
                                              if (wins[index] < roundNumber) {
                                                wins[index] += 1;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      Ink(
                                        decoration: const ShapeDecoration(
                                          shape: CircleBorder(),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(Icons.remove_circle_outline),
                                          color: Colors.black,
                                          onPressed: () {
                                            setState(() {
                                              if (wins[index] != 0) {
                                                wins[index] -= 1;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                          )),
                      Flexible(
                        flex: 1,
                        child:
                        ElevatedButton(
                            style: mainButton,
                            onPressed: () {
                              //update player bet info in presenter
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return EnterResultsView();
                                  }));
                            },
                            child: const Text('Submit Bets')),

                      ),
                    ],
                )),
            )
          )
      ));
  }
}
