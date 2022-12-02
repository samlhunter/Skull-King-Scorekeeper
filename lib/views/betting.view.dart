import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull_king_scorekeeper/components/FeaturesDrawer.component.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/views/enterResults.view.dart';
import 'package:skull_king_scorekeeper/models/game.models.dart';

import '../utils/constants.dart';

class BettingView extends StatefulWidget {
  @override
  _BettingViewState createState() => _BettingViewState();
}

class _BettingViewState extends State<BettingView> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameModel>();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Round ${game.roundNumber} - Bets'),
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
                      SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Place Yer Bets',
                        style: TextStyle(fontSize: 40),
                      ),
                      Flexible(
                          flex: 5,
                          child: ListView.separated(
                            padding: const EdgeInsets.all(8),
                            itemCount: game.players.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  children: [
                                    if (index == 0) ...[
                                      Row(
                                        children: const [
                                          Text(
                                            "Player",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                          ),
                                          Spacer(
                                            flex: 9,
                                          ),
                                          Text(
                                            "Bet",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                          ),
                                          Spacer(
                                            flex: 5,
                                          ),
                                        ],
                                      ),
                                    ],
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white54.withOpacity(0.4),
                                          border: Border.all(
                                            color: Colors.white54,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child:Row(children: [
                                        Text(game.players[index].name),
                                        Spacer(
                                          flex: 8,
                                        ),
                                        Text('${game.players[index].rounds[game.roundNumber - 1].bet}'),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(Icons.add_circle_outline),
                                            color: Colors.black,
                                            onPressed: () {
                                              game.players[index].rounds[game.roundNumber - 1].incrementBet();
                                              game.notifyListeners(); // TODO fix this hack later!
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
                                              game.players[index].rounds[game.roundNumber - 1].decrementBet();
                                              game.notifyListeners(); // TODO fix this hack later!
                                            },
                                          ),
                                        ),
                                      ]),
                                    ),


                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => const Divider(),
                          )),
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(
                            style: mainButton,
                            onPressed: () {
                              //update player bet info in presenter
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return EnterResultsView();
                              }));
                            },
                            child: const Text('Submit Bets')),
                      ),
                    ],
                  )),
                ))));
  }
}
