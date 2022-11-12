import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/startingRound.view.dart';

import '../components/FeaturesDrawer.component.dart';

class EndOfRoundView extends StatefulWidget {
  @override
  _EndOfRoundViewState createState() => _EndOfRoundViewState();
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
//TODO get list of bets from presenter
final List<int> bets = <int>[0, 0, 0, 0, 0];
final List<int> wins = <int>[0, 0, 0, 0, 0];
//TODO get round number from presenter
int roundNumber = 10;

class _EndOfRoundViewState extends State<EndOfRoundView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text('Round ${roundNumber} Bonuses'),
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
                    const SizedBox(height: 25,),
                    const Text(
                      'Get Yer Coffer',
                      style: TextStyle(fontSize: 40),
                    ),
                    Flexible(
                      flex: 5,
                        child: ListView.separated(
                          padding: const EdgeInsets.all(12),
                          itemCount: players.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child:
                                  Column(
                                    children: [
                                      if(index == 0) ...[
                                        Row(
                                          children: const [
                                            Text("Player", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                            Spacer(flex: 9,),
                                            Text("Bonus", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                            Spacer(flex: 2,),
                                            Text("Score", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
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
                      flex: 2,
                      child:
                          Column(
                            children:[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:const [
                                  OutlinedButton(onPressed: null, child: Text('+10')),
                                  OutlinedButton(onPressed: null, child: Text('+20')),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  OutlinedButton(onPressed: null, child: Text('Mermaid +20')),
                                  OutlinedButton(onPressed: null, child: Text('Pirate +30')),
                                  OutlinedButton(onPressed: null, child: Text('Skull King +50')),
                                ],
                              ),
                            ],
                          ),),
                    Flexible(
                      flex: 1,
                      child:
                      ElevatedButton(
                          style: mainButton,
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return StartingRoundView();
                            }));
                          },
                          child: const Text('Next Round!')),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}