import 'package:flutter/material.dart';

class PlayerRoundModel extends ChangeNotifier {
  int bet = 0;
  int won = 0;
  // which bonuses they won
  int miscellaneousPoints = 0;
  bool gotMermaid = false;
  bool gotPirateBonus = false;
  bool gotSkullKing = false;

  void incrementBet() {
    bet += 1;
    notifyListeners();
  }

  void decrementBet() {
    bet -= 1;
    if (bet < 0) {
      bet = 0;
    }
    notifyListeners();
  }

  void incrementWon() {
    won += 1;
    notifyListeners();
  }

  void decrementWon() {
    won -= 1;
    if (won < 0) {
      won = 0;
    }
    notifyListeners();
  }

  set setGotMermaid(gotMermaid) => this.gotMermaid = gotMermaid;

  set setMiscellaneousPoints(miscellaneousPoints) => this.miscellaneousPoints = miscellaneousPoints;

  set setGotPirateBonus(gotPirateBonus) => this.gotPirateBonus = gotPirateBonus;

  set setGotSkullKing(gotSkullKing) => this.gotSkullKing = gotSkullKing;
}
