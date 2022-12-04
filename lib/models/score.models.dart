class Score {
  // Round number
  int round = 0;
  // Bet amount
  int bet = 0;
  // How many hands were won by the player
  int handsWon = 0;
  // Bonus points
  int bonus = 0;
  // Current Round Score
  int roundScore = 0;
  // Current Active Total Score up to the point of play
  int runningScore = 0;

  // Score Formal Constructor
  Score(this.round, this.bet, this.handsWon, this.bonus, this.roundScore,
      this.runningScore);

  // Getter/Setter for round
  int get getRound => round;
  set setRound(int round) => this.round = round;

  // Getter/setter for bet
  int get getBet => bet;
  set setBet(int bet) => this.bet = bet;

  // Getter/setter for rounds won
  int get getHandsWon => handsWon;
  set setHandsWon(int handsWon) => this.handsWon = handsWon;

  // Getter/setter for bonus points
  int get getBonus => bonus;
  set setBonus(int bonus) => this.bonus = bonus;

  // Getter/setter for round score
  int get getRoundScore => roundScore;
  set setRoundScore(int roundScore) => this.roundScore = roundScore;

  // Getter/setter for running score
  int get getRunningScore => runningScore;
  set setRunningScoer(int runningScore) => this.runningScore = runningScore;
}
