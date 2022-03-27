require './lib/game'

#What is this file supposed to do?
  #Rather than write out lengthy code in the runner file, I have created a game class file in which to do the following:
  #-create standard deck of 52 cards
  #-assign randomness to the deck of 52 cards (.shuffle)
  #-split standard deck into two decks of 26 cards each
  #-create two players and assign each player their half of the split deck
  #-define a start method to include the welcome message, collect user input(gets.chomp) to either start a new game or quit the application/error out, play turns in a loop with a turn count limit until either a win or a draw occurs
  #-display either a winner or a draw message at the end of play

game = Game.new
game.start
