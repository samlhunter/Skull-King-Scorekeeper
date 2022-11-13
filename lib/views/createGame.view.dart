import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/utils/buttons.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/startingRound.view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateGameView extends StatefulWidget {
  @override
  _CreateGameViewState createState() => _CreateGameViewState();
}

class _CreateGameViewState extends State<CreateGameView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  String playerName = "";
  List<String> players = <String>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: mainDecoration,
                child: Padding(
                  // Symetric Padding
                  padding: EdgeInsets.fromLTRB(5, 60, 5, 40),

                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                        child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        const Text(
                          'Add Yer Pirates!',
                          style: TextStyle(fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                        Expanded(
                            child: ListView.separated(
                          padding: const EdgeInsets.all(8),
                          itemCount: players.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              color: Colors.amber,
                              child: Row(children: [
                                Text(
                                  'Player:  ${players[index]}',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Spacer(),
                                Ink(
                                  decoration: const ShapeDecoration(
                                    color: Colors.lightBlue,
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(FontAwesomeIcons.trashCan),
                                    color: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        players.removeAt(index);
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
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          child: ElevatedButton(
                              style: mainButton,
                              onPressed: () {
                                if (players.length < 8) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: <Widget>[
                                              Positioned(
                                                right: -40.0,
                                                top: -40.0,
                                                child: InkResponse(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: CircleAvatar(
                                                    child: Icon(Icons.close),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                ),
                                              ),
                                              Form(
                                                key: _formKey,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller:
                                                            textController,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Player Name',
                                                          icon: Icon(
                                                            FontAwesomeIcons
                                                                .skullCrossbones,
                                                            size:
                                                                30, //Icon Size
                                                            color: Colors
                                                                .black, //Color Of Icon
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ElevatedButton(
                                                        style: mainButton,
                                                        child: Text("Add"),
                                                        onPressed: () {
                                                          if (_formKey
                                                                  .currentState!
                                                                  .validate() &&
                                                              textController
                                                                      .text
                                                                      .length >
                                                                  0) {
                                                            setState(() {
                                                              playerName =
                                                                  textController
                                                                      .text;
                                                              players.add(
                                                                  playerName);
                                                            });
                                                            _formKey
                                                                .currentState!
                                                                .save();

                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            _formKey
                                                                .currentState!
                                                                .reset();
                                                            textController
                                                                .clear();
                                                          }
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                } else {
                                  // set up the button
                                  Widget okButton = TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  );

                                  AlertDialog alert = AlertDialog(
                                    title: Text("Ahoy there!"),
                                    content: Text(
                                        "Sorry, You can't add more than 8 members to your crew!"),
                                    actions: [
                                      okButton,
                                    ],
                                  );

                                  // show the dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                }
                              },
                              child: const Text('Add Pirate')),
                        ),
                        ElevatedButton(
                            style: mainButton,
                            onPressed: () {
                              //TODO: send names to presenter to be created and stored in cache
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return StartingRoundView();
                              }));
                            },
                            child: const Text('Arrg!')),
                      ],
                    )),
                  ),
                ))));
  }
}
