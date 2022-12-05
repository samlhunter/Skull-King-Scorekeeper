// Tests for the playerRound.model.dart file

// Total tests in this file: 12

// See flutter documentation for instructions about how to run file.
// Simplest run method is running the following command:
// flutter test test/playerRound.model.test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:skull_king_scorekeeper/models/playerRound.model.dart';

void main() {
  // HERE IS THE GROUP TESTING INCREMENTING AND DECREMENTING BETS
  group('Bets', () {
    test('Increment a bet given a higher round number', () {
      final prm = PlayerRoundModel();

      // Pass in round 4
      prm.incrementBet(4);

      // Make sure it is equal to 1
      expect(prm.bet, 1);
    });

    test('Increment a bet multiple times given higher round number', () {
      final prm = PlayerRoundModel();

      // Pass in round 7
      prm.incrementBet(7);
      prm.incrementBet(7);
      prm.incrementBet(7);

      // Make sure it is equal to 3
      expect(prm.bet, 3);
    });

    test('Bet does not increment if the round is lower than the bet', () {
      final prm = PlayerRoundModel();

      // Pass in round 3
      prm.incrementBet(1);
      prm.incrementBet(1);

      // Bet should only increase to 1, not to 2
      expect(prm.bet, 1);
    });

    test('Decrements the bet', () {
      final prm = PlayerRoundModel();

      prm.incrementBet(4);
      prm.incrementBet(4);
      prm.incrementBet(4);

      prm.decrementBet();

      // Bet should be 2
      expect(prm.bet, 2);
    });
  });

  //---------------------------------------------------------------------------

  // HERE IS THE GROUP TESTING INCREMENTING AND DECREMENTING WINS
  group('Wins', () {
    test('Increment a win given a higher round number', () {
      final prm = PlayerRoundModel();

      // Pass in round 4
      prm.incrementWon(4);

      // Make sure it is equal to 1
      expect(prm.won, 1);
    });

    test('Increment a win multiple times given higher round number', () {
      final prm = PlayerRoundModel();

      // Pass in round 7
      prm.incrementWon(7);
      prm.incrementWon(7);
      prm.incrementWon(7);

      // Make sure it is equal to 3
      expect(prm.won, 3);
    });

    test('Win does not increment if the round is lower than the win count', () {
      final prm = PlayerRoundModel();

      // Pass in round 3
      prm.incrementWon(1);
      prm.incrementWon(1);

      // Bet should only increase to 1, not to 2
      expect(prm.won, 1);
    });

    test('Decrements the bet', () {
      final prm = PlayerRoundModel();

      prm.incrementWon(4);
      prm.incrementWon(4);
      prm.incrementWon(4);

      prm.decrementWon();

      // Bet should be 2
      expect(prm.won, 2);
    });
  });

  //---------------------------------------------------------------------------

  // HERE IS THE GROUP TESTING BONUS UPDATING AND UNDOING
  group('Bonus', () {
    test('Bet = Won : Update bonus adds points and pushes to stack', () {
      final prm = PlayerRoundModel();

      // Same bet and won value
      prm.bet = 3;
      prm.won = 3;

      // Make sure bonusStack is empty
      expect(prm.bonusStack.isEmpty, true);

      // Update the Bonus
      prm.updateBonus(20);

      // Make sure bonusStack has value and miscPoints is the correct value
      expect(prm.miscellaneousPoints, 20);
      expect(prm.bonusStack.isEmpty, false);
    });

    test('Bet != Won: Update bonus will not add to misc points nor stack', () {
      final prm = PlayerRoundModel();

      // Different bet and won values
      prm.bet = 1;
      prm.won = 2;

      // Make sure bonusStack is empty
      expect(prm.bonusStack.isEmpty, true);

      prm.updateBonus(20);

      //Make sure bonusStack has no value and miscPoints doesn't get added to
      expect(prm.miscellaneousPoints, 0);
      expect(prm.bonusStack.isEmpty, true);
    });

    test('UndoBonus works with nonempty stack', () {
      final prm = PlayerRoundModel();

      // Make bonus stack have value
      prm.updateBonus(20);

      // Make sure stack has value
      expect(prm.bonusStack.isEmpty, false);

      // Undo bonus
      prm.undoBonus();

      // miscPoints and bonus stack should now be 0 and empty respectively
      expect(prm.miscellaneousPoints, 0);
      expect(prm.bonusStack.isEmpty, true);
    });
  });

  //---------------------------------------------------------------------------

  // HERE IS THE GROUP TESTING STACK RESET
  group('Stack Reset', () {
    test('Stack clears when called', () {
      final prm = PlayerRoundModel();

      // Add bonuses to stack
      prm.updateBonus(20);
      prm.updateBonus(30);
      prm.updateBonus(10);

      // Clear the stack
      prm.resetStack();

      // Stack should be empty again
      expect(prm.bonusStack.isEmpty, true);
    });
  });
}
