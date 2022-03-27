require './lib/game'

#What is this file supposed to do?
  #Rather than write out this code in the runner file, I have created a game class file in which to do the following:
  #-create standard deck of 52 cards
  #-split standard deck into two decks of 26 cards each
  #-create two players and assign each player their half of the split deck
  #-define a start method to include the welcome message, collect user input to either start a new game or quit the application, play turns in a loop until either a win or a draw occurs  


game = Game.new
game.start
