class Player {
  // Name of the player
  String name = '';
  // ID for current game
  String currGameId = '';
  // List of game objects for any game player has played in
  List gameHistory = [];

  Player(this.name, this.currGameId) {
    gameHistory = [];
  }

  String get getName => name;
  set setName(String name) => this.name = name;

  String get getCurrGameId => currGameId;
  set setCurrGameId(String currGameId) => this.currGameId = currGameId;

  List get getGameHistory => gameHistory;
  set setGameHistory(List gameHistory) => this.gameHistory = gameHistory;
}
