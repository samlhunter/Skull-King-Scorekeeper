import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull_king_scorekeeper/components/FeaturesDrawer.component.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/models/game.models.dart';
import 'package:skull_king_scorekeeper/views/initialScreen.view.dart';

import '../utils/constants.dart';

class GameResultsView extends StatefulWidget {
  @override
  _GameResultsViewState createState() => _GameResultsViewState();
}

class _GameResultsViewState extends State<GameResultsView> {
  @override
  Widget build(BuildContext context) {
    var game = context.watch<GameModel>();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Final Results'),
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
                        'See Yer Rankings',
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                          Spacer(),
                                          Text(
                                            "Score",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                        ],
                                      ),
                                    ],
                                    Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Colors.white54.withOpacity(0.4),
                                          border: Border.all(
                                            color: Colors.white54,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Text(game.players[index].name,
                                            style:
                                                const TextStyle(fontSize: 20)),
                                        const Spacer(),
                                        Text(
                                            '${game.players[index].calcScore()}',
                                            style:
                                                const TextStyle(fontSize: 20)),
                                      ]),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          )),
                      Flexible(
                          flex: 1,
                          child: ElevatedButton(
                              style: mainButton,
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return InitialScreenView();
                                }));
                              },
                              child: const Text('Return To Home'))),
                    ],
                  ),
                ),
              ),
            )));
  }
}
