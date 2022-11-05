import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/views/createGame.view.dart';

class InitialScreenView extends StatefulWidget {
  @override
  _InitialScreenViewState createState() => _InitialScreenViewState();
}

class _InitialScreenViewState extends State<InitialScreenView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            appBar: AppBar(title: const Text('Start')),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome to Skull King Scorekeeper!',
                  style: TextStyle(fontSize: 50),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                const Text(
                  'Here you can create a new game or resume a previous one!',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                Spacer(
                  flex: 3,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CreateGameView();
                      }));
                    },
                    child: const Text('Create New Game')),
                const OutlinedButton(
                    onPressed: null,
                    child: Text(
                        'Continue Previous Game')), // null onPressed == disabled button
                Spacer()
              ],
            )),
      ),
    );
  }
}
