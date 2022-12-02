import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull_king_scorekeeper/models/playerRound.model.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/startingRound.view.dart';
import 'package:skull_king_scorekeeper/models/game.models.dart';

import '../components/FeaturesDrawer.component.dart';

class EndOfRoundView extends StatefulWidget {
  @override
  _EndOfRoundViewState createState() => _EndOfRoundViewState();
}

int selectedPlayer = -1;

class _EndOfRoundViewState extends State<EndOfRoundView> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameModel>();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Round ${game.roundNumber} Bonuses'),
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
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Get Yer Coffer',
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
                                        flex: 15,
                                      ),
                                      Text(
                                        "Bonus",
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                      ),
                                      Spacer(
                                        flex: 2,
                                      ),
                                      Text(
                                        "Score",
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
                                  child: Row(children: [
                                    Text(game.players[index].name),
                                    Spacer(
                                      flex: 3,
                                    ),
                                    Text('${game.players[index].calcRoundBonus(game.roundNumber - 1)}'),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text('${game.players[index].calcScore()}'),
                                    Ink(
                                      decoration: const ShapeDecoration(
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: selectedPlayer != index
                                            ? const Icon(Icons.radio_button_off)
                                            : const Icon(Icons.radio_button_checked),
                                        color: Colors.black,
                                        onPressed: () {
                                          setState(() {
                                            if (selectedPlayer == index) {
                                              selectedPlayer = -1;
                                            } else {
                                              selectedPlayer = index;
                                            }
                                          });
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
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(backgroundColor: Colors.white54.withOpacity(0.4)),

                                onPressed: () {
                                  if (selectedPlayer != -1) {
                                    game.players[selectedPlayer].rounds[game.roundNumber - 1].miscellaneousPoints += 10;
                                    game.notifyListeners();
                                  }
                                },
                                child: const Text('+10', style: TextStyle(fontSize: 15, color: Colors.black),)),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(backgroundColor: Colors.white54.withOpacity(0.4)),

                                onPressed: () {
                                  if (selectedPlayer != -1) {
                                    game.players[selectedPlayer].rounds[game.roundNumber - 1].miscellaneousPoints += 20;
                                    game.notifyListeners();
                                  }
                                },
                                child: const Text('+20',style: TextStyle(fontSize: 15, color: Colors.black),)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(backgroundColor: Colors.white54.withOpacity(0.4)),

                                onPressed: () {
                                  if (selectedPlayer != -1) {
                                    PlayerRoundModel round = game.players[selectedPlayer].rounds[game.roundNumber - 1];
                                    round.gotMermaid = !round.gotMermaid;
                                    game.notifyListeners();
                                  }
                                },
                                child: const Text('Mermaid +20',style: TextStyle(fontSize: 15, color: Colors.black),)),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(backgroundColor: Colors.white54.withOpacity(0.4)),

                                onPressed: () {
                                  if (selectedPlayer != -1) {
                                    PlayerRoundModel round = game.players[selectedPlayer].rounds[game.roundNumber - 1];
                                    round.gotPirateBonus = !round.gotPirateBonus;
                                    game.notifyListeners();
                                  }
                                },
                                child: const Text('Pirate +30',style: TextStyle(fontSize: 15, color: Colors.black),)),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(backgroundColor: Colors.white54.withOpacity(0.4)),
                                onPressed: () {
                                  if (selectedPlayer != -1) {
                                    PlayerRoundModel round = game.players[selectedPlayer].rounds[game.roundNumber - 1];
                                    round.gotSkullKing = !round.gotSkullKing;
                                    game.notifyListeners();
                                  }
                                },
                                child: const Text('Skull King +50',style: TextStyle(fontSize: 15, color: Colors.black),)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ElevatedButton(
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
