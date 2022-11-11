import 'package:skull_king_scorekeeper/models/player.models.dart';

class Game {
  // Id given to game
  String id = '';
  // Map of settings with rule/setting and boolean for enabled
  Map settings = {};
  // Map of players where name/id will map to player object
  Map players = {};
  // Player initialized to null
  Player? winner;
  // Map of players and scores
  Map scores = {};

  Game(this.settings, this.players);

  String get getId => id;
  set setId(String id) => this.id = id;

  Map get getSettings => settings;
  set setSettings(Map settings) => this.settings = settings;

  Map get getPlayers => players;
  set setPlayers(Map players) => this.players = players;

  Player? get getWinner => winner;
  set setWinner(Player? winner) => this.winner = winner;

  Map get getScores => scores;
  set setScores(Map scores) => this.scores = scores;
}
