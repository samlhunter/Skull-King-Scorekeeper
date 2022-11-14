import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/views/endOfRound.view.dart';
import 'package:skull_king_scorekeeper/models/game.models.dart';

import '../components/FeaturesDrawer.component.dart';
import '../utils/constants.dart';

class EnterResultsView extends StatefulWidget {
  @override
  _EnterResultsViewState createState() => _EnterResultsViewState();
}

class _EnterResultsViewState extends State<EnterResultsView> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameModel>();
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Round ${game.roundNumber} - Wins'),
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
                      'How\'d you do?',
                      style: TextStyle(fontSize: 40),
                    ),
                    Flexible(
                        flex: 5,
                        child: ListView.separated(
                          padding: const EdgeInsets.all(12),
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
                                          flex: 2,
                                        ),
                                        Text(
                                          "Wins",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        Spacer(
                                          flex: 5,
                                        ),
                                      ],
                                    ),
                                  ],
                                  Row(children: [
                                    Text(game.players[index].name),
                                    Spacer(
                                      flex: 3,
                                    ),
                                    Text('${game.players[index].rounds[game.roundNumber - 1].bet}'),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text('${game.players[index].rounds[game.roundNumber - 1].won}'),
                                    Ink(
                                      decoration: const ShapeDecoration(
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add_circle_outline),
                                        color: Colors.black,
                                        onPressed: () {
                                          game.players[index].rounds[game.roundNumber - 1].incrementWon();
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
                                          game.players[index].rounds[game.roundNumber - 1].decrementWon();
                                          game.notifyListeners(); // TODO fix this hack later!
                                        },
                                      ),
                                    ),
                                  ]),
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
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return EndOfRoundView();
                            }));
                          },
                          child: const Text('Round Results')),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
