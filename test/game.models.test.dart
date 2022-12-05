// Tests for the game.models.dart file

// Total tests in this file: 0

// See flutter documentation for instructions about how to run file.
// Simplest run method is running the following command:
// flutter test test/game.models.test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:skull_king_scorekeeper/models/game.models.dart';
import 'package:skull_king_scorekeeper/models/player.models.dart';

void main() {
  // HERE IS THE GROUP TESTING ADDING AND REMOVING PLAYERS
  group('add and remove players', () {
    test('Add players function adds correct number of players', () {
      // Initalize Player
      final player1 = Player('Player1');

      // Initalize game model
      final gameModel = GameModel();

      // Add player to game model
      gameModel.addPlayer(player1);

      // Players array should have a player in it
      expect(gameModel.players.length, 1);
    });

    test('Remove player at function should remove proper index', () {
      // Initalize Players
      final player1 = Player('Player1');
      final player2 = Player('Player2');

      // Initalize game model
      final gameModel = GameModel();

      // Add player to game models
      gameModel.addPlayer(player1);
      gameModel.addPlayer(player2);

      // Remove first player
      gameModel.removePlayerAt(0);

      // Players array should only have player 2
      expect(gameModel.players.length, 1);
      expect(gameModel.players[0].name, 'Player2');
    });
  });

  //---------------------------------------------------------------------------

  // HERE IS THE GROUP TESTING RESTART GAME FUNCTION
  group('Restart Game function', () {
    test('Restart game function works without any prior data', () {
      // Initalize game model
      final gameModel = GameModel();

      // Call restart game
      gameModel.restartGame();

      // Players array and round number should be empty and zero respectively
      expect(gameModel.players.length, 0);
      expect(gameModel.roundNumber, 0);
    });

    test('Restart game function works with prior data', () {
      // Initalize players
      final player1 = Player('player1');
      final player2 = Player('player2');

      // Initalize game model
      final gameModel = GameModel();

      // Put data into game model
      gameModel.players.add(player1);
      gameModel.players.add(player2);
      gameModel.roundNumber = 5;

      // Call restart game
      gameModel.restartGame();

      // Players array and round number should be empty and zero respectively
      expect(gameModel.players.length, 0);
      expect(gameModel.roundNumber, 0);
    });
  });

  //---------------------------------------------------------------------------

  // HERE IS THE GROUP TESTING SET ROUND NUMBER AND ADVANCE ROUND
  group('set round number and advance round', () {
    test('set round number function properly sets round number', () {
      // Initalize game model
      final gameModel = GameModel();

      // Set round number function
      gameModel.setRoundNumber(5);

      // Make sure round number is 5
      expect(gameModel.roundNumber, 5);
    });

    test('advance round incremements round with no prior round set', () {
      // Initalize game model
      final gameModel = GameModel();

      // Call advance Round
      gameModel.advanceRound();

      // Advance round should be 1
      expect(gameModel.roundNumber, 1);
    });

    test('advance round incremements round with prior round set', () {
      // Initalize game model
      final gameModel = GameModel();

      // Set round
      gameModel.setRoundNumber(5);

      // Call advance Round
      gameModel.advanceRound();

      // Advance round should be 6
      expect(gameModel.roundNumber, 6);
    });

    test('advance round incremements round and adds player round model', () {
      // Initialize players
      final player1 = Player('player1');
      final player2 = Player('player2');

      // Initalize game model
      final gameModel = GameModel();

      // Add players to game model
      gameModel.players.add(player1);
      gameModel.players.add(player2);

      // Set round
      gameModel.setRoundNumber(5);

      // Call advance Round
      gameModel.advanceRound();

      // Advance round should be 6 and both players should have a round
      expect(gameModel.roundNumber, 6);
      expect(gameModel.players[0].rounds.length, 1);
      expect(gameModel.players[1].rounds.length, 1);
    });
  });
}
