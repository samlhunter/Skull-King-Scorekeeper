import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/views/endOfRound.view.dart';

import '../components/FeaturesDrawer.component.dart';

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
          appBar: AppBar(title: Text('Round $roundNumber - Wins')),
          drawer: generateGameDrawer(context),
          body: Column(
            children: [
              const Text(
                'How\'d you do?',
                style: TextStyle(fontSize: 30),
              ),
              Expanded(
                  child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: players.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Row(children: [
                      Text('Player:  ${players[index]}'),
                      Spacer(
                        flex: 3,
                      ),
                      Text('Bet:  ${bets[index]}'),
                      Spacer(
                        flex: 1,
                      ),
                      Text('Wins:  ${wins[index]}'),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.lightBlue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          color: Colors.white,
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
                          color: Colors.lightBlue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          color: Colors.white,
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
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EndOfRoundView();
                    }));
                  },
                  child: const Text('Round Results'))
            ],
          )),
    );
  }
}
