// Tests for the playerRound.model.dart file

// Total tests in this file: 5

// See flutter documentation for instructions about how to run file.
// Simplest run method is running the following command:
// flutter test test/player.models.test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:skull_king_scorekeeper/models/player.models.dart';
import 'package:skull_king_scorekeeper/models/playerRound.model.dart';

void main() {
  // HERE IS THE GROUP TESTING CALC SCORE FUNCTION
  group('calcScore', () {
    test('Calc Score function returns appropriate value with 2 rounds', () {
      // Initialize two rounds for the player
      final prm1 = PlayerRoundModel();
      final prm2 = PlayerRoundModel();

      // Set those round bet and won values
      prm1.bet = 0;
      prm1.won = 0;
      prm2.bet = 1;
      prm2.won = 1;

      // Initialize a player and make sure the calc Score function is accurate
      final player = Player('TestUser');
      player.rounds.add(prm1);
      player.rounds.add(prm2);

      // print(player.calcScore());

      // Player score should be 30
      expect(player.calcScore(), 30);
    });

    test('Calc Score has correct value, not always getting correct bet', () {
      // Initialize two rounds for the player
      final prm1 = PlayerRoundModel();
      final prm2 = PlayerRoundModel();
      final prm3 = PlayerRoundModel();
      final prm4 = PlayerRoundModel();
      final prm5 = PlayerRoundModel();

      // Set those round bet and won values
      prm1.bet = 0;
      prm1.won = 0;
      prm2.bet = 1;
      prm2.won = 1;
      prm3.bet = 1;
      prm3.won = 1;
      prm4.bet = 3;
      prm4.won = 3;
      prm5.bet = 0;
      prm5.won = 1;

      // Initialize a player and make sure the calc Score function is accurate
      final player = Player('TestUser');
      player.rounds.add(prm1);
      player.rounds.add(prm2);
      player.rounds.add(prm3);
      player.rounds.add(prm4);
      player.rounds.add(prm5);

      // print(player.calcScore());

      // Player score should be 60 since TestUser lost 50 on round 5
      expect(player.calcScore(), 60);
    });

    test('Calc Score has correct value, bet value was a number, won was off',
        () {
      // Initialize two rounds for the player
      final prm1 = PlayerRoundModel();
      final prm2 = PlayerRoundModel();
      final prm3 = PlayerRoundModel();
      final prm4 = PlayerRoundModel();
      final prm5 = PlayerRoundModel();

      // Set those round bet and won values
      prm1.bet = 0;
      prm1.won = 0;
      prm2.bet = 1;
      prm2.won = 1;
      prm3.bet = 1;
      prm3.won = 1;
      prm4.bet = 3;
      prm4.won = 3;
      prm5.bet = 4;
      prm5.won = 1;

      // Initialize a player and make sure the calc Score function is accurate
      final player = Player('TestUser');
      player.rounds.add(prm1);
      player.rounds.add(prm2);
      player.rounds.add(prm3);
      player.rounds.add(prm4);
      player.rounds.add(prm5);

      // print(player.calcScore());

      // Player score should be 80 since TestUser lost 30 on round 5
      expect(player.calcScore(), 80);
    });
  });

  //---------------------------------------------------------------------------

  // HERE IS THE GROUP TESTING CALC ROUND BONUS FUNCTION
  group('calcRoundBonus', () {
    test('Calc round bonus has 0 score round has no bonus', () {
      // No rounds were initialized
      final prm1 = PlayerRoundModel();
      prm1.miscellaneousPoints = 0;

      // Initialize a player with no rounds
      final player = Player('TestUser');
      player.rounds.add(prm1);

      // Round bonus should be zero if misc points are zero
      expect(player.calcRoundBonus(0), 0);
    });

    test('Calc round bonus gets correct round bonus value', () {
      // Initialize three rounds for the player
      final prm1 = PlayerRoundModel();
      final prm2 = PlayerRoundModel();
      final prm3 = PlayerRoundModel();

      // Set those round bet and won values
      prm1.miscellaneousPoints = 20;
      prm2.miscellaneousPoints = 10;
      prm3.miscellaneousPoints = 30;

      // Initialize a player and make sure the calc Score function is accurate
      final player = Player('TestUser');
      player.rounds.add(prm1);
      player.rounds.add(prm2);
      player.rounds.add(prm3);

      // Round bonus should be 10 since we are accessing the second index
      expect(player.calcRoundBonus(1), 10);
    });

    // test('calc round bonus throws error if out of range index is passed', () {
    //   // Initialize two rounds for the player
    //   final prm1 = PlayerRoundModel();
    //   final prm2 = PlayerRoundModel();
    //   final prm3 = PlayerRoundModel();

    //   // Set those round bet and won values
    //   prm1.miscellaneousPoints = 20;
    //   prm2.miscellaneousPoints = 10;
    //   prm3.miscellaneousPoints = 30;

    //   // Initialize a player and make sure the calc Score function is accurate
    //   final player = Player('TestUser');
    //   player.rounds.add(prm1);
    //   player.rounds.add(prm2);
    //   player.rounds.add(prm3);

    //   // calc round bonus should throw error if out of range index
    //   //expect(player.calcRoundBonus(3), throwsA(throwsRangeError));
    // });
  });
}
