import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/models/playerRound.model.dart';

class Player extends ChangeNotifier {
  // Name of the player
  String name = '';

  List<PlayerRoundModel> rounds = [];

  Player(this.name);

  // calculates the score of a player based on their rounds history in the game
  int calcScore() {
    int score = 0;

    for (int i = 0; i < rounds.length; i++) {
      PlayerRoundModel round = rounds[i];

      // I don't know if this scoring is actually accurate
      if (round.won == round.bet) {
        if (round.bet == 0) {
          score += 10 * (i + 1);
        } else {
          score += round.bet * 20;
        }
        score += calcRoundBonus(i);
      } else {
        if (round.bet == 0) {
          score -= 10 * (i + 1);
        } else {
          score -= (round.bet - round.won).abs() * 10;
        }
      }
    }

    return score;
  }

  int calcRoundBonus(int roundIndex) {
    PlayerRoundModel round = rounds[roundIndex];
    int score = 0;
    score += round.miscellaneousPoints;
    return score;
  }

  // calculate the bonus points for the user for a particular round
  /*int calcRoundBonus(int roundIndex) {
    PlayerRoundModel round = rounds[roundIndex];
    int score = 0;
    score += round.miscellaneousPoints;
    if (round.gotMermaid) {
      score += 20;
    }
    if (round.gotPirateBonus) {
      score += 30;
    }
    if (round.gotSkullKing) {
      score += 50;
    }
    return score;
  }*/

  // String get getName => name;
  // set setName(String name) => this.name = name;

  // String get getCurrGameId => currGameId;
  // set setCurrGameId(String currGameId) => this.currGameId = currGameId;

  // List get getGameHistory => gameHistory;
  // set setGameHistory(List gameHistory) => this.gameHistory = gameHistory;
}
