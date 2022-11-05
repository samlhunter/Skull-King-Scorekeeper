import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/components/FeaturesDrawer.component.dart';
import 'package:skull_king_scorekeeper/views/enterResults.view.dart';

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
          appBar: AppBar(title: Text('Round $roundNumber - Bets')),
          drawer: generateGameDrawer(context),
          body: Column(
            children: [
              const Text(
                'Place Yer Bets',
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
                      Spacer(),
                      Text('Bet:  ${bets[index]}'),
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
                              if (bets[index] < roundNumber) {
                                bets[index] += 1;
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
                              if (bets[index] > 0) {
                                bets[index] -= 1;
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
                    //update player bet info in presenter
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EnterResultsView();
                    }));
                  },
                  child: const Text('Submit Bets'))
            ],
          )),
    );
  }
}
