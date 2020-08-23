require './lib/card'
require './lib/deck'
require './lib/player'
require  './lib/turn'
require  './lib/game'



#lay out card suits, values, and ranks
# suit = [:hearts, :spades, :diamonds, :clubs]
# value = ["Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
# "Ten", "Jack", "Queen", "King", "Ace"]
# rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
#build deck *no idea how to build the deck*
suites = [:hearts, :diamonds, :clubs, :spaids]
card_values_ranks = {
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

cards1 =[]

suites.each do |suite|
  card_values_ranks.each do |value, rank|
    cards1 << Card.new(suite, value, rank)
  end
end


cards1.shuffle!

cards2 = cards1.shift(26)
deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)
# require "pry"; binding.pry

game = Game.new(turn)

game.start



reply = gets.chomp.upcase
if reply = "GO"
  game.play
end
