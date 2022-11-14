import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/models/player.models.dart';
import 'package:skull_king_scorekeeper/models/playerRound.model.dart';

class GameModel extends ChangeNotifier {
  List<Player> players = [];
  int roundNumber = 0; // after creating players we'll advance the round and increment this

  void addPlayer(Player player) {
    players.add(player);
    notifyListeners();
  }

  void removePlayerAt(int index) {
    players.removeAt(index);
    notifyListeners();
  }

  void restartGame() {
    // reset everything as far as the game goes
    players = [];
    roundNumber = 0;
    notifyListeners();
  }

  void setRoundNumber(int round) {
    roundNumber = round;
    notifyListeners();
  }

  void advanceRound() {
    if (roundNumber <= 9) {
      roundNumber += 1;
      players.forEach((player) {
        player.rounds.add(PlayerRoundModel());
      });
    }
  }

  // // Id given to game
  // String id = '';
  // // Map of settings with rule/setting and boolean for enabled
  // Map settings = {};
  // // Player initialized to null
  // Player? winner;
  // // Map of players and scores
  // Map scores = {};

  // GameModel(this.settings, this.players);

  // String get getId => id;
  // set setId(String id) => this.id = id;

  // Map get getSettings => settings;
  // set setSettings(Map settings) => this.settings = settings;

  // Player? get getWinner => winner;
  // set setWinner(Player? winner) => this.winner = winner;

  // Map get getScores => scores;
  // set setScores(Map scores) => this.scores = scores;
}
