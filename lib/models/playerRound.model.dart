import 'package:flutter/material.dart';

class PlayerRoundModel extends ChangeNotifier {
  int bet = 0;
  int won = 0;
  // which bonuses they won
  int miscellaneousPoints = 0;
  bool gotMermaid = false;
  bool gotPirateBonus = false;
  bool gotSkullKing = false;

  Stack bonusStack = Stack<int>();

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

  void updateBonus(int bonus) {
    bonusStack.push(bonus);
    miscellaneousPoints += bonus;
    notifyListeners();
  }

  void undoBonus() {
    if (bonusStack.isEmpty == false) {
      int bonus = bonusStack.pop();
      miscellaneousPoints -= bonus;
      notifyListeners();
    }
  }

  //set setGotMermaid(gotMermaid) => this.gotMermaid = gotMermaid;

  //set setMiscellaneousPoints(miscellaneousPoints) => this.miscellaneousPoints = miscellaneousPoints;

  //set setGotPirateBonus(gotPirateBonus) => this.gotPirateBonus = gotPirateBonus;

  //set setGotSkullKing(gotSkullKing) => this.gotSkullKing = gotSkullKing;

  void resetStack() {
    while (bonusStack.isEmpty == false) {
      bonusStack.pop();
    }
  }
}

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }

  bool get isEmpty => _storage.isEmpty;

  void push(E element) => _storage.add(element);
  E pop() => _storage.removeLast();
}
