require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require  './lib/turn'
require './lib/game'
require 'pry'

card_values_and_ranks = {
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "10" => 10,
  "Jack" => 11,
  "Queen" => 12,
  "King" => 13,
  "Ace" => 14,
}
#Here I create a hash that is showing the values and ranks in a card deck.
suites = [:clubs, :hearts, :spades, :diamonds]
#Here I state the suites in a card deck.

cards1 = []
card_values_and_ranks.each do |value, rank|
  suites.each do |suite|
    cards1.push(Card.new(suite, value, rank))
  end
end
#Here I am telling my code to add each suite, value, and rank (for a total of 52)
#cards to the cards1 empty array so I get an array of 52 cards

cards1.shuffle!
#Here I tell my cards1 array to shuffle, but I have to add a banger(!) because
#if I do not, the cards array will return the shuffle in the proper deck order

cards2  = cards1.pop(26)
#Here I am setting cards2 equal to the last half of cards1
deck1   = Deck.new(cards1)
player1 = Player.new("Megan", deck1)
deck2   = Deck.new(cards2)
player2 = Player.new("Aurora", deck2)
# turn    = Turn.new(player1, player2)
#Here are assigned instances with their arguments which are taken from my other
#test files
game    = Game.new(player1, player2)
#Here I am creating a new instance of the game class and giving it the argument
#of turn
game.start
#I use the start method of the game class to print the opening statement
# user_input = gets.chomp
#   if user_input == "GO"
#   game.play
#   else
#   game.start
# end
#Here I am telling the code to ask the user to input something after the opening
#game statement appears. If they do not type verbatim, GO, then they will see the
#opening statement again.-
