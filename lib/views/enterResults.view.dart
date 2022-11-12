import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/views/endOfRound.view.dart';

import '../components/FeaturesDrawer.component.dart';
import '../utils/constants.dart';

class EnterResultsView extends StatefulWidget {
  @override
  _EnterResultsViewState createState() => _EnterResultsViewState();
}

//Get list of players from presenter
final List<String> players = <String>[
  'Josh',
  'Corban',
  'Blake',
  'Britton',
  'Ignacio'
];
final List<int> colorCodes = <int>[600, 600, 600, 600, 600];
//get list of bets from presenter
final List<int> bets = <int>[0, 0, 0, 0, 0];
final List<int> wins = <int>[0, 0, 0, 0, 0];
//get round number from presenter
int roundNumber = 10;

class _EnterResultsViewState extends State<EnterResultsView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Round $roundNumber - Wins'),
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
                      'How\'d you do?',
                      style: TextStyle(fontSize: 40),
                    ),
                    Flexible(
                        flex: 5,
                        child: ListView.separated(
                          padding: const EdgeInsets.all(12),
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
                                        Spacer(flex: 2,),
                                        Text("Wins", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                        Spacer(flex: 5,),
                                      ],
                                    ),
                                  ],
                                  Row(children: [
                                    Text('${players[index]}'),
                                    Spacer(flex: 3,),
                                    Text('${bets[index]}'),
                                    Spacer(flex: 1,),
                                    Text('${wins[index]}'),
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
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return EndOfRoundView();
                                  }));
                            },
                            child: const Text('Round Results')),
                    ),
                    SizedBox(height: 25,),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
